
# transformations after airbyte sync

I believe airbyte needs the transformations at the root of the repository.

This is a repository to test this using the use case of "how many people are currently working at somenergia?"

There's a weekly incremental deduped+history airbyte task which syncs hr_employee, hr_department and hr_employee_calendar between odoo and data warehouse and then applies the model to materialize the filtered list of active employees.

this is a test to see if everything works as expected. The best would be to find out how to use somenergia-kpis/dbt_kpis or the rellevant transformation repository

# troubleshooting

dbt run also needs a directory without hyphens. that's why this repository is called airbytetransformations instead of airbyte-transformations. We'll need to find a workaround for this as well.