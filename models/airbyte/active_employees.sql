{{ config(materialized='table') }}

	SELECT distinct on (he.id)
        he.id as employee_id,
        he.active,
        he.gender,
        he.marital,
        he.children,
        he.birthday,
        he.km_home_work,
        hd.name as department,
        he.create_date,
        he.write_date,
        he.theoretical_hours_start_date,
        hc.date_start,
        hc.date_end
    FROM {{ source('odoo', 'airbyte_odoo_hr_employee') }} AS he
    LEFT JOIN {{ source('odoo', 'airbyte_odoo_hr_department') }} AS hd
    ON he.department_id = hd.id
    left join {{ source('odoo', 'airbyte_odoo_hr_employee_calendar') }} as hc
    on hc.employee_id = he.id
    WHERE he.work_email IS NOT NULL
    AND he.user_id IS NOT NULL
    AND hc.date_start IS NOT NULL
	AND hc.date_start <= CURRENT_DATE
    AND (hc.date_end IS NULL OR CURRENT_DATE <= hc.date_end)
	AND he.active is TRUE
    order by he.id, hc.create_date desc