ALTER TABLE applicant_accounts
    ADD COLUMN profile_summary_html LONGTEXT NULL AFTER last_login_utc,
    ADD COLUMN work_experience_json JSON NULL AFTER profile_summary_html,
    ADD COLUMN education_json JSON NULL AFTER work_experience_json;

ALTER TABLE applicant_resumes
    ADD COLUMN is_current TINYINT(1) NOT NULL DEFAULT 0 AFTER source_candidate_resume_id;

UPDATE applicant_resumes ar
JOIN (
    SELECT applicant_account_id, MAX(applicant_resume_id) AS latest_resume_id
    FROM applicant_resumes
    WHERE deleted_utc IS NULL
    GROUP BY applicant_account_id
) latest ON latest.latest_resume_id = ar.applicant_resume_id
SET ar.is_current = 1;
