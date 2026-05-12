ALTER TABLE applicant_accounts
    ADD COLUMN profile_summary_html LONGTEXT NULL AFTER last_login_utc,
    ADD COLUMN work_experience_json JSON NULL AFTER profile_summary_html,
    ADD COLUMN education_json JSON NULL AFTER work_experience_json;
