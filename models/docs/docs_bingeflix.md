# Bingeflix Docs
This file contains documentation for Bingeflix data sources.

## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when they sign up for a Bingeflix account.
{% enddocs %}

{% docs bingeflix_column_user_created_at %}
The timestamp when the user's account was created.
{% enddocs %}

{% docs bingeflix_column_user_deleted_at %}
The timestamp when the user's account was deleted. Will be null if it's still an active account.
{% enddocs %}

{% docs bingeflix_column_user_full_name %}
The full name of the user associated with the account.
{% enddocs %}

{% docs bingeflix_column_username %}
The username is associated with the user's account.
{% enddocs %}

{% docs bingeflix_column_user_email %}
The email address for the user account.
{% enddocs %}

{% docs bingeflix_column_user_region %}
The region where the user lives.
{% enddocs %}

{% docs bingeflix_column_user_country %}
The country where the user lives.
{% enddocs %}

{% docs bingeflix_column_user_phone_number %}
The phone number of the user.
{% enddocs %}

{% docs bingeflix_column_user_sex %}
The user's gender at time of birth. Contains values M or F
{% enddocs %}

{% docs bingeflix_column_user_birth_date %}
The date of the user's birth.
{% enddocs %}


## Subscriptions
This section contains documentation from the Bingeflix Users table which are also used in other Finance models downstream.

{% docs bingeflix_column_subscription_plan_id %}
The subscription identifier. A plan id will not be null.
{% enddocs %}

{% docs bingeflix_column_subscription_id %}
The unique identifier for the subscription.
{% enddocs %}

{% docs bingeflix_column_subscription_starts_at %}
The timestamp when the subscription started.
{% enddocs %}

{% docs bingeflix_column_subscription_ends_at %}
The timestamp when the subscription ended. If it is null the subscription is active or auto-renew is not turned off.
{% enddocs %}

{% docs bingeflix_column_plan_name %}
The name of the subscription plan.
{% enddocs %}

## Events

This section contains documentation from the Bingeflix events table.

{% docs bingeflix_column_event_session_id %}
The unique identifier of the session in the Bingeflix application.
{% enddocs %}

{% docs bingeflix_column_event_created_at %}
The timestamp that the event was logged.
{% enddocs %}

{% docs bingeflix_column_event_name%}
The name of the event.
{% enddocs %}

## Dates

This section contains documentation for commonly used data columns across the data set

{% docs bingeflix_column_calendar_date %}
The calendar date.
{% enddocs %}


{% docs bingeflix_column_date_week %}
The start date of the calendar week (week starting on Monday).
{% enddocs %}

{% docs bingeflix_column_date_month %}
The first date of the calendar month.
{% enddocs %}

{% docs bingeflix_column_date_quarter %}
The first date of the calendar quarter.
{% enddocs %}

{% docs bingeflix_column_date_year %}
The first date of the calendar year.
{% enddocs %}

{% docs bingeflix_column_day_of_month %}
The day of the month.
{% enddocs %}

{% docs bingeflix_column_year_number %}
The year number (e.g. 2018).
{% enddocs %}

{% docs bingeflix_column_quarter_number %}
The quarter number (between 1 and 4).
{% enddocs %}

{% docs bingeflix_column_month_number %}
The month number (between 1 and 12).
{% enddocs %}
