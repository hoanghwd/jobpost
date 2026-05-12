/*
 Navicat Premium Data Transfer

 Source Server         : www.huynhdous.com_3306
 Source Server Type    : MySQL
 Source Server Version : 80045
 Source Host           : www.huynhdous.com:3306
 Source Schema         : jobportal

 Target Server Type    : MySQL
 Target Server Version : 80045
 File Encoding         : 65001

 Date: 11/05/2026 12:39:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `account_id` int(0) NOT NULL,
  `officeFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `officeName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ownerName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `countryId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `accountTypeFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `underCCId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `careerBuilderLink` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `active` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createdBy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createdDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `removedBy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `removedDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `removedReason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sccId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `schedulingPod` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `onlyAdPosting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `postingAdsForAccountFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `appActivated` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `empApply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `showJobBoardDropDown` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `appointmentPop` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `phoneBurner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `fileUploadEnabled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `schedulerUniqueKey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `headHuntUniqueKey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `timezoneFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `TZAcknowledge` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createdDate2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `removedDate2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `divisionFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `accName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `timezoneSQLId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `isJobBoard` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `timezoneSqlName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `zoomActive` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `dupeRemoveType` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `rrsEnabled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `phoneBuzzerLite` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `d2dOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `isSCCOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `AIMessaging` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DCA2Notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `AISMSAutomation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `AIExtraction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `autoProcessing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `aiModel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `aiModelDev` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `aiUsage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `aiShowNotice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `aiDeactivateDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ai_default_template_pool
-- ----------------------------
DROP TABLE IF EXISTS `ai_default_template_pool`;
CREATE TABLE `ai_default_template_pool`  (
  `template_pool_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `template_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `template_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `template_category` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `channel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `flow_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_selected_default` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`template_pool_id`) USING BTREE,
  UNIQUE INDEX `uq_ai_default_template_pool_key_name`(`template_key`, `template_name`) USING BTREE,
  INDEX `idx_ai_default_template_pool_lookup`(`template_key`, `is_selected_default`, `is_active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_account_candidates
-- ----------------------------
DROP TABLE IF EXISTS `applicant_account_candidates`;
CREATE TABLE `applicant_account_candidates`  (
  `applicant_account_candidate_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_account_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `link_reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'backfill',
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_account_candidate_id`) USING BTREE,
  UNIQUE INDEX `uq_applicant_account_candidates_candidate`(`candidate_id`) USING BTREE,
  INDEX `idx_applicant_account_candidates_account`(`applicant_account_id`) USING BTREE,
  CONSTRAINT `fk_applicant_account_candidates_account` FOREIGN KEY (`applicant_account_id`) REFERENCES `applicant_accounts` (`applicant_account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_applicant_account_candidates_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_accounts
-- ----------------------------
DROP TABLE IF EXISTS `applicant_accounts`;
CREATE TABLE `applicant_accounts`  (
  `applicant_account_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `zipcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `timezone_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password_set_utc` datetime(0) NULL DEFAULT NULL,
  `active_resume_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending_password',
  `last_login_utc` datetime(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_account_id`) USING BTREE,
  UNIQUE INDEX `uq_applicant_accounts_username`(`username`) USING BTREE,
  INDEX `idx_applicant_accounts_name`(`last_name`, `first_name`) USING BTREE,
  INDEX `idx_applicant_accounts_status`(`status`) USING BTREE,
  INDEX `idx_applicant_accounts_active_resume`(`active_resume_id`) USING BTREE,
  INDEX `idx_applicant_accounts_email`(`email`) USING BTREE,
  INDEX `idx_applicant_accounts_phone`(`phone`) USING BTREE,
  CONSTRAINT `fk_applicant_accounts_active_resume` FOREIGN KEY (`active_resume_id`) REFERENCES `applicant_resumes` (`applicant_resume_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_intake_pipeline_runs
-- ----------------------------
DROP TABLE IF EXISTS `applicant_intake_pipeline_runs`;
CREATE TABLE `applicant_intake_pipeline_runs`  (
  `pipeline_run_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `run_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'running',
  `host_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `process_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `enqueue_limit` int(0) NOT NULL DEFAULT 0,
  `process_limit` int(0) NOT NULL DEFAULT 0,
  `promote_limit` int(0) NOT NULL DEFAULT 0,
  `stale_minutes` int(0) NOT NULL DEFAULT 0,
  `queued_count` int(0) NULL DEFAULT NULL,
  `claimed_count` int(0) NULL DEFAULT NULL,
  `processed_count` int(0) NULL DEFAULT NULL,
  `failed_count` int(0) NULL DEFAULT NULL,
  `promoted_count` int(0) NULL DEFAULT NULL,
  `worker_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `enqueue_output_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `process_output_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `process_summary_json` json NULL,
  `promote_output_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `promoted_rows_json` json NULL,
  `raw_log_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `started_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `completed_utc` datetime(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`pipeline_run_id`) USING BTREE,
  INDEX `idx_aipr_status_started`(`run_status`, `started_utc`) USING BTREE,
  INDEX `idx_aipr_started`(`started_utc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_job_match_adjustments
-- ----------------------------
DROP TABLE IF EXISTS `applicant_job_match_adjustments`;
CREATE TABLE `applicant_job_match_adjustments`  (
  `applicant_adjustment_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_match_score_id` bigint(0) UNSIGNED NOT NULL,
  `adjustment_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adjustment_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adjustment_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adjustment_direction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'neutral',
  `raw_adjustment_points` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `applied_adjustment_points` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `max_positive_points` decimal(6, 2) NULL DEFAULT NULL,
  `max_negative_penalty` decimal(6, 2) NULL DEFAULT NULL,
  `score_before_adjustment` decimal(5, 2) NULL DEFAULT NULL,
  `score_after_adjustment` decimal(5, 2) NULL DEFAULT NULL,
  `review_flag` tinyint(1) NOT NULL DEFAULT 0,
  `is_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `triggered_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `reason_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `evidence_json` json NULL,
  `calculation_json` json NULL,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_adjustment_id`) USING BTREE,
  INDEX `idx_ajma_score`(`applicant_match_score_id`, `sort_order`) USING BTREE,
  INDEX `idx_ajma_category`(`adjustment_category`) USING BTREE,
  INDEX `idx_ajma_review`(`review_flag`) USING BTREE,
  CONSTRAINT `fk_ajma_score` FOREIGN KEY (`applicant_match_score_id`) REFERENCES `applicant_job_match_scores` (`applicant_match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59272 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_job_match_requirement_evaluations
-- ----------------------------
DROP TABLE IF EXISTS `applicant_job_match_requirement_evaluations`;
CREATE TABLE `applicant_job_match_requirement_evaluations`  (
  `applicant_requirement_eval_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_match_score_id` bigint(0) UNSIGNED NOT NULL,
  `criteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcriteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `requirement_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requirement_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requirement_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requirement_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `job_required_value` decimal(10, 2) NULL DEFAULT NULL,
  `job_required_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `candidate_value` decimal(10, 2) NULL DEFAULT NULL,
  `candidate_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `match_result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unknown',
  `match_strength` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `points_possible` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `points_earned` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `penalty_possible` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `penalty_applied` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `tolerance_value` decimal(10, 2) NULL DEFAULT NULL,
  `tolerance_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `within_tolerance` tinyint(1) NULL DEFAULT NULL,
  `is_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `triggered_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `review_flag` tinyint(1) NOT NULL DEFAULT 0,
  `candidate_evidence_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `evidence_json` json NULL,
  `calculation_json` json NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_requirement_eval_id`) USING BTREE,
  INDEX `idx_ajmre_score`(`applicant_match_score_id`, `sort_order`) USING BTREE,
  INDEX `idx_ajmre_result`(`match_result`) USING BTREE,
  INDEX `idx_ajmre_review`(`review_flag`) USING BTREE,
  CONSTRAINT `fk_ajmre_score` FOREIGN KEY (`applicant_match_score_id`) REFERENCES `applicant_job_match_scores` (`applicant_match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 141742 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_job_match_review_flags
-- ----------------------------
DROP TABLE IF EXISTS `applicant_job_match_review_flags`;
CREATE TABLE `applicant_job_match_review_flags`  (
  `applicant_review_flag_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_match_score_id` bigint(0) UNSIGNED NOT NULL,
  `flag_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `flag_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `flag_severity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'info',
  `flag_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'review',
  `flag_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `evidence_json` json NULL,
  `is_resolved` tinyint(1) NOT NULL DEFAULT 0,
  `resolved_by_user_id` bigint(0) NULL DEFAULT NULL,
  `resolved_utc` datetime(0) NULL DEFAULT NULL,
  `resolution_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_review_flag_id`) USING BTREE,
  UNIQUE INDEX `uq_ajmrf_score_flag`(`applicant_match_score_id`, `flag_key`) USING BTREE,
  INDEX `idx_ajmrf_score`(`applicant_match_score_id`, `is_resolved`) USING BTREE,
  INDEX `idx_ajmrf_severity`(`flag_severity`) USING BTREE,
  CONSTRAINT `fk_ajmrf_score` FOREIGN KEY (`applicant_match_score_id`) REFERENCES `applicant_job_match_scores` (`applicant_match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 63667 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_job_match_scores
-- ----------------------------
DROP TABLE IF EXISTS `applicant_job_match_scores`;
CREATE TABLE `applicant_job_match_scores`  (
  `applicant_match_score_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_pool_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NOT NULL,
  `applicant_resume_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `applicant_parse_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `job_match_extraction_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `scoring_profile_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `scoring_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'resume_match_tree_v1',
  `model_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `has_resume` tinyint(1) NOT NULL DEFAULT 0,
  `resume_priority_boost` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `overall_score` decimal(4, 2) NOT NULL DEFAULT 1.00,
  `skill_score` decimal(4, 2) NULL DEFAULT NULL,
  `experience_score` decimal(4, 2) NULL DEFAULT NULL,
  `responsibility_score` decimal(4, 2) NULL DEFAULT NULL,
  `education_score` decimal(4, 2) NULL DEFAULT NULL,
  `location_score` decimal(4, 2) NULL DEFAULT NULL,
  `application_completeness_score` decimal(4, 2) NULL DEFAULT NULL,
  `core_score` decimal(4, 2) NULL DEFAULT NULL,
  `adjustment_score` decimal(5, 2) NULL DEFAULT NULL,
  `positive_adjustment_points` decimal(5, 2) NULL DEFAULT NULL,
  `negative_penalty_points` decimal(5, 2) NULL DEFAULT NULL,
  `capped_penalty_points` decimal(5, 2) NULL DEFAULT NULL,
  `education_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `role_level_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `work_history_stability_score` decimal(4, 2) NULL DEFAULT NULL,
  `compensation_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `availability_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `rating_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recommendation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `initial_evaluation_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `initial_evaluation_summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `initial_evaluation_json` json NULL,
  `tree_terminal_node_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tree_terminal_node_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `decision_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'scored_pending_review',
  `recruiter_review_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending_review',
  `recruiter_decision` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recruiter_decision_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reviewed_by_user_id` bigint(0) NULL DEFAULT NULL,
  `reviewed_utc` datetime(0) NULL DEFAULT NULL,
  `promoted_candidate_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `promoted_utc` datetime(0) NULL DEFAULT NULL,
  `revoked_by_user_id` bigint(0) NULL DEFAULT NULL,
  `revoked_utc` datetime(0) NULL DEFAULT NULL,
  `revoke_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `score_explanation` json NULL,
  `score_breakdown_json` json NULL,
  `tree_path_json` json NULL,
  `scoring_config_snapshot` json NULL,
  `review_flags_json` json NULL,
  `point_total_json` json NULL,
  `tolerance_summary_json` json NULL,
  `scored_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_match_score_id`) USING BTREE,
  UNIQUE INDEX `uq_applicant_job_match_current`(`applicant_pool_id`, `job_post_id`, `scoring_version`) USING BTREE,
  INDEX `idx_ajms_job_score`(`job_post_id`, `overall_score`) USING BTREE,
  INDEX `idx_ajms_applicant`(`applicant_pool_id`) USING BTREE,
  INDEX `idx_ajms_office_status_score`(`office_id`, `decision_status`, `overall_score`) USING BTREE,
  INDEX `idx_ajms_review_status`(`recruiter_review_status`, `overall_score`) USING BTREE,
  INDEX `idx_ajms_resume`(`applicant_resume_id`) USING BTREE,
  INDEX `idx_ajms_parse`(`applicant_parse_id`) USING BTREE,
  INDEX `idx_ajms_promoted_candidate`(`promoted_candidate_id`) USING BTREE,
  INDEX `fk_ajms_job_extraction`(`job_match_extraction_id`) USING BTREE,
  CONSTRAINT `fk_ajms_applicant` FOREIGN KEY (`applicant_pool_id`) REFERENCES `job_applicant_pool` (`applicant_pool_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_ajms_job` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ajms_job_extraction` FOREIGN KEY (`job_match_extraction_id`) REFERENCES `job_post_match_extractions` (`job_match_extraction_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_ajms_parse` FOREIGN KEY (`applicant_parse_id`) REFERENCES `job_applicant_resume_parses` (`applicant_parse_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_ajms_resume` FOREIGN KEY (`applicant_resume_id`) REFERENCES `job_applicant_resumes` (`applicant_resume_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14819 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_processing_queue
-- ----------------------------
DROP TABLE IF EXISTS `applicant_processing_queue`;
CREATE TABLE `applicant_processing_queue`  (
  `processing_queue_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_pool_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NOT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `queue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'resume_score',
  `queue_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `priority` int(0) NOT NULL DEFAULT 50,
  `attempt_count` int(0) NOT NULL DEFAULT 0,
  `max_attempts` int(0) NOT NULL DEFAULT 3,
  `locked_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lock_token` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `locked_utc` datetime(0) NULL DEFAULT NULL,
  `started_utc` datetime(0) NULL DEFAULT NULL,
  `completed_utc` datetime(0) NULL DEFAULT NULL,
  `failed_utc` datetime(0) NULL DEFAULT NULL,
  `last_error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `payload_json` json NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`processing_queue_id`) USING BTREE,
  UNIQUE INDEX `uq_applicant_processing_queue_applicant_job_type`(`applicant_pool_id`, `job_post_id`, `queue_type`) USING BTREE,
  INDEX `idx_apq_status_priority`(`queue_status`, `priority`, `created_utc`) USING BTREE,
  INDEX `idx_apq_lock`(`lock_token`) USING BTREE,
  INDEX `idx_apq_applicant`(`applicant_pool_id`) USING BTREE,
  INDEX `idx_apq_job`(`job_post_id`) USING BTREE,
  INDEX `idx_apq_office_status`(`office_id`, `queue_status`) USING BTREE,
  CONSTRAINT `fk_apq_applicant` FOREIGN KEY (`applicant_pool_id`) REFERENCES `job_applicant_pool` (`applicant_pool_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_apq_job` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_remove_reasons
-- ----------------------------
DROP TABLE IF EXISTS `applicant_remove_reasons`;
CREATE TABLE `applicant_remove_reasons`  (
  `reason_id` int(0) NOT NULL AUTO_INCREMENT,
  `reason_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reason_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort_order` int(0) NOT NULL DEFAULT 100,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`reason_id`) USING BTREE,
  UNIQUE INDEX `uq_applicant_remove_reasons_key`(`reason_key`) USING BTREE,
  INDEX `idx_applicant_remove_reasons_active_sort`(`is_active`, `sort_order`, `reason_label`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applicant_resumes
-- ----------------------------
DROP TABLE IF EXISTS `applicant_resumes`;
CREATE TABLE `applicant_resumes`  (
  `applicant_resume_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_account_id` bigint(0) UNSIGNED NOT NULL,
  `resume_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'candidate_backfill',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_size_bytes` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `raw_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `text_hash` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source_candidate_resume_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_utc` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`applicant_resume_id`) USING BTREE,
  UNIQUE INDEX `uq_applicant_resumes_source_candidate_resume`(`source_candidate_resume_id`) USING BTREE,
  INDEX `idx_applicant_resumes_account`(`applicant_account_id`) USING BTREE,
  INDEX `idx_applicant_resumes_account_deleted`(`applicant_account_id`, `deleted_utc`) USING BTREE,
  INDEX `idx_applicant_resumes_text_hash`(`text_hash`) USING BTREE,
  CONSTRAINT `fk_applicant_resumes_account` FOREIGN KEY (`applicant_account_id`) REFERENCES `applicant_accounts` (`applicant_account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_applicant_resumes_source_candidate_resume` FOREIGN KEY (`source_candidate_resume_id`) REFERENCES `candidate_resumes` (`resume_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_ai_parse_batch_items
-- ----------------------------
DROP TABLE IF EXISTS `candidate_ai_parse_batch_items`;
CREATE TABLE `candidate_ai_parse_batch_items`  (
  `batch_item_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `resume_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `account_id` bigint(0) NULL DEFAULT NULL,
  `item_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'queued',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attempt_count` int(0) NOT NULL DEFAULT 0,
  `max_attempts` int(0) NOT NULL DEFAULT 2,
  `locked_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lock_token` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `locked_utc` datetime(0) NULL DEFAULT NULL,
  `started_utc` datetime(0) NULL DEFAULT NULL,
  `completed_utc` datetime(0) NULL DEFAULT NULL,
  `current_json` json NULL,
  `parsed_json` json NULL,
  `diff_json` json NULL,
  `applied_fields_json` json NULL,
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`batch_item_id`) USING BTREE,
  UNIQUE INDEX `uq_candidate_ai_parse_batch_candidate`(`batch_id`, `candidate_id`) USING BTREE,
  INDEX `idx_candidate_ai_parse_items_status`(`item_status`, `created_utc`) USING BTREE,
  INDEX `idx_candidate_ai_parse_items_candidate`(`candidate_id`) USING BTREE,
  INDEX `idx_candidate_ai_parse_items_resume`(`resume_id`) USING BTREE,
  INDEX `idx_candidate_ai_parse_items_lock`(`locked_by`, `locked_utc`) USING BTREE,
  CONSTRAINT `fk_candidate_ai_parse_items_batch` FOREIGN KEY (`batch_id`) REFERENCES `candidate_ai_parse_batches` (`batch_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_candidate_ai_parse_items_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_ai_parse_batches
-- ----------------------------
DROP TABLE IF EXISTS `candidate_ai_parse_batches`;
CREATE TABLE `candidate_ai_parse_batches`  (
  `batch_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `requested_by_user_id` bigint(0) NULL DEFAULT NULL,
  `auto_accept` tinyint(1) NOT NULL DEFAULT 0,
  `batch_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'queued',
  `total_count` int(0) NOT NULL DEFAULT 0,
  `queued_count` int(0) NOT NULL DEFAULT 0,
  `parsing_count` int(0) NOT NULL DEFAULT 0,
  `parsed_count` int(0) NOT NULL DEFAULT 0,
  `updated_count` int(0) NOT NULL DEFAULT 0,
  `needs_review_count` int(0) NOT NULL DEFAULT 0,
  `failed_count` int(0) NOT NULL DEFAULT 0,
  `cancelled_count` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `started_utc` datetime(0) NULL DEFAULT NULL,
  `completed_utc` datetime(0) NULL DEFAULT NULL,
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`batch_id`) USING BTREE,
  INDEX `idx_candidate_ai_parse_batches_status`(`batch_status`, `created_utc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_chat_tokens
-- ----------------------------
DROP TABLE IF EXISTS `candidate_chat_tokens`;
CREATE TABLE `candidate_chat_tokens`  (
  `token_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `access_token` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  `expires_utc` datetime(0) NULL DEFAULT NULL,
  `last_access_utc` datetime(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`token_id`) USING BTREE,
  UNIQUE INDEX `uq_candidate_chat_tokens_access_token`(`access_token`) USING BTREE,
  INDEX `idx_candidate_chat_tokens_conversation_id`(`conversation_id`) USING BTREE,
  INDEX `idx_candidate_chat_tokens_candidate_id`(`candidate_id`) USING BTREE,
  INDEX `idx_candidate_chat_tokens_status`(`status`) USING BTREE,
  CONSTRAINT `fk_candidate_chat_tokens_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_candidate_chat_tokens_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_chat_verifications
-- ----------------------------
DROP TABLE IF EXISTS `candidate_chat_verifications`;
CREATE TABLE `candidate_chat_verifications`  (
  `verification_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `token_id` bigint(0) UNSIGNED NOT NULL,
  `pin_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verified_utc` datetime(0) NULL DEFAULT NULL,
  `attempt_count` int(0) NOT NULL DEFAULT 0,
  `resend_count` int(0) NOT NULL DEFAULT 0,
  `last_sent_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pending_resend_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `awaiting_email_confirm` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `locked_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `locked_utc` datetime(0) NULL DEFAULT NULL,
  `last_attempt_utc` datetime(0) NULL DEFAULT NULL,
  `pin_last_sent_utc` datetime(0) NULL DEFAULT NULL,
  `pin_expires_utc` datetime(0) NULL DEFAULT NULL,
  `first_reply_received` tinyint(1) NOT NULL DEFAULT 0,
  `verification_stage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'awaiting_initial_candidate_reply_for_verification',
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`verification_id`) USING BTREE,
  UNIQUE INDEX `uq_ccv_token`(`token_id`) USING BTREE,
  INDEX `idx_ccv_conversation`(`conversation_id`) USING BTREE,
  INDEX `idx_ccv_candidate`(`candidate_id`) USING BTREE,
  INDEX `idx_ccv_verified`(`is_verified`) USING BTREE,
  INDEX `idx_ccv_locked`(`is_locked`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_interview_decisions
-- ----------------------------
DROP TABLE IF EXISTS `candidate_interview_decisions`;
CREATE TABLE `candidate_interview_decisions`  (
  `decision_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `conversation_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `booking_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `decision_key` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `decision_label` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `decision_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `next_stage_key` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `decided_by_user_id` bigint(0) NULL DEFAULT NULL,
  `decided_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`decision_id`) USING BTREE,
  INDEX `idx_cid_decided`(`candidate_id`, `decided_utc`) USING BTREE,
  INDEX `idx_booking`(`booking_id`) USING BTREE,
  INDEX `idx_conversation`(`conversation_id`) USING BTREE,
  INDEX `idx_decision_key`(`decision_key`) USING BTREE,
  INDEX `idx_decided_by`(`decided_by_user_id`) USING BTREE,
  CONSTRAINT `fk_candidate_interview_decisions_booking` FOREIGN KEY (`booking_id`) REFERENCES `interview_bookings` (`booking_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_candidate_interview_decisions_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_candidate_interview_decisions_conversation` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_candidate_interview_decisions_user` FOREIGN KEY (`decided_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_invitation_queue
-- ----------------------------
DROP TABLE IF EXISTS `candidate_invitation_queue`;
CREATE TABLE `candidate_invitation_queue`  (
  `queue_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NOT NULL,
  `match_score_id` bigint(0) UNSIGNED NOT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `queue_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending_recruiter_approval',
  `priority_rank` int(0) NULL DEFAULT NULL,
  `approved_by_user_id` bigint(0) NULL DEFAULT NULL,
  `approved_utc` datetime(0) NULL DEFAULT NULL,
  `revoked_by_user_id` bigint(0) NULL DEFAULT NULL,
  `revoked_utc` datetime(0) NULL DEFAULT NULL,
  `revoke_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `scheduled_for_utc` datetime(0) NULL DEFAULT NULL,
  `sent_conversation_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `sent_utc` datetime(0) NULL DEFAULT NULL,
  `last_error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`queue_id`) USING BTREE,
  UNIQUE INDEX `uq_invitation_queue_candidate_job`(`candidate_id`, `job_post_id`) USING BTREE,
  INDEX `idx_invitation_queue_status_rank`(`queue_status`, `priority_rank`) USING BTREE,
  INDEX `idx_invitation_queue_score`(`match_score_id`) USING BTREE,
  INDEX `idx_invitation_queue_office`(`office_id`, `queue_status`) USING BTREE,
  INDEX `idx_invitation_queue_approved_by`(`approved_by_user_id`) USING BTREE,
  INDEX `idx_invitation_queue_revoked_by`(`revoked_by_user_id`) USING BTREE,
  INDEX `idx_invitation_queue_conversation`(`sent_conversation_id`) USING BTREE,
  INDEX `fk_invitation_queue_job`(`job_post_id`) USING BTREE,
  CONSTRAINT `fk_invitation_queue_approved_by` FOREIGN KEY (`approved_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_invitation_queue_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_invitation_queue_conversation` FOREIGN KEY (`sent_conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_invitation_queue_job` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_invitation_queue_revoked_by` FOREIGN KEY (`revoked_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_invitation_queue_score` FOREIGN KEY (`match_score_id`) REFERENCES `candidate_job_match_scores` (`match_score_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_invitation_queue_events
-- ----------------------------
DROP TABLE IF EXISTS `candidate_invitation_queue_events`;
CREATE TABLE `candidate_invitation_queue_events`  (
  `queue_event_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue_id` bigint(0) UNSIGNED NOT NULL,
  `event_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `previous_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `new_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_by_user_id` bigint(0) NULL DEFAULT NULL,
  `event_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `event_json` json NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`queue_event_id`) USING BTREE,
  INDEX `idx_queue_events_queue`(`queue_id`) USING BTREE,
  INDEX `idx_queue_events_type`(`event_type`) USING BTREE,
  INDEX `idx_queue_events_user`(`created_by_user_id`) USING BTREE,
  CONSTRAINT `fk_queue_events_queue` FOREIGN KEY (`queue_id`) REFERENCES `candidate_invitation_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_queue_events_user` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_job_match_adjustments
-- ----------------------------
DROP TABLE IF EXISTS `candidate_job_match_adjustments`;
CREATE TABLE `candidate_job_match_adjustments`  (
  `adjustment_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_score_id` bigint(0) UNSIGNED NOT NULL,
  `adjustment_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adjustment_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adjustment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'fit',
  `adjustment_direction` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'neutral',
  `raw_adjustment_points` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `applied_adjustment_points` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `max_positive_points` decimal(6, 2) NULL DEFAULT NULL,
  `max_negative_penalty` decimal(6, 2) NULL DEFAULT NULL,
  `score_before_adjustment` decimal(4, 2) NULL DEFAULT NULL,
  `score_after_adjustment` decimal(4, 2) NULL DEFAULT NULL,
  `review_flag` tinyint(1) NOT NULL DEFAULT 0,
  `is_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `triggered_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `reason_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `evidence_json` json NULL,
  `calculation_json` json NULL,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`adjustment_id`) USING BTREE,
  UNIQUE INDEX `uq_match_adjustment_key`(`match_score_id`, `adjustment_key`) USING BTREE,
  INDEX `idx_match_adjustments_match`(`match_score_id`) USING BTREE,
  INDEX `idx_match_adjustments_key`(`adjustment_key`) USING BTREE,
  INDEX `idx_match_adjustments_review`(`review_flag`, `triggered_disqualifier`) USING BTREE,
  CONSTRAINT `fk_match_adjustments_match` FOREIGN KEY (`match_score_id`) REFERENCES `candidate_job_match_scores` (`match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1666 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_job_match_requirement_evaluations
-- ----------------------------
DROP TABLE IF EXISTS `candidate_job_match_requirement_evaluations`;
CREATE TABLE `candidate_job_match_requirement_evaluations`  (
  `requirement_eval_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_score_id` bigint(0) UNSIGNED NOT NULL,
  `criteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcriteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `requirement_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requirement_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requirement_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requirement_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `job_required_value` decimal(8, 2) NULL DEFAULT NULL,
  `job_required_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `candidate_value` decimal(8, 2) NULL DEFAULT NULL,
  `candidate_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `match_result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unknown',
  `match_strength` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `points_possible` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `points_earned` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `penalty_possible` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `penalty_applied` decimal(6, 2) NOT NULL DEFAULT 0.00,
  `tolerance_value` decimal(8, 2) NULL DEFAULT NULL,
  `tolerance_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `within_tolerance` tinyint(1) NULL DEFAULT NULL,
  `is_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `triggered_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `review_flag` tinyint(1) NOT NULL DEFAULT 0,
  `candidate_evidence_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `evidence_json` json NULL,
  `calculation_json` json NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`requirement_eval_id`) USING BTREE,
  UNIQUE INDEX `uq_requirement_eval_match_key`(`match_score_id`, `criteria_key`, `requirement_type`, `requirement_key`) USING BTREE,
  INDEX `idx_requirement_eval_match`(`match_score_id`) USING BTREE,
  INDEX `idx_requirement_eval_criteria`(`criteria_key`, `subcriteria_key`) USING BTREE,
  INDEX `idx_requirement_eval_result`(`match_result`, `match_strength`) USING BTREE,
  INDEX `idx_requirement_eval_review`(`review_flag`, `triggered_disqualifier`) USING BTREE,
  CONSTRAINT `fk_requirement_eval_match` FOREIGN KEY (`match_score_id`) REFERENCES `candidate_job_match_scores` (`match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1453 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_job_match_review_flags
-- ----------------------------
DROP TABLE IF EXISTS `candidate_job_match_review_flags`;
CREATE TABLE `candidate_job_match_review_flags`  (
  `review_flag_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_score_id` bigint(0) UNSIGNED NOT NULL,
  `flag_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `flag_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `flag_severity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'info',
  `flag_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'review',
  `is_resolved` tinyint(1) NOT NULL DEFAULT 0,
  `resolved_by_user_id` bigint(0) NULL DEFAULT NULL,
  `resolved_utc` datetime(0) NULL DEFAULT NULL,
  `resolution_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `flag_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `evidence_json` json NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`review_flag_id`) USING BTREE,
  UNIQUE INDEX `uq_match_review_flag`(`match_score_id`, `flag_key`) USING BTREE,
  INDEX `idx_review_flags_match`(`match_score_id`) USING BTREE,
  INDEX `idx_review_flags_status`(`is_resolved`, `flag_severity`) USING BTREE,
  INDEX `idx_review_flags_resolved_by`(`resolved_by_user_id`) USING BTREE,
  CONSTRAINT `fk_review_flags_match` FOREIGN KEY (`match_score_id`) REFERENCES `candidate_job_match_scores` (`match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_flags_resolved_by` FOREIGN KEY (`resolved_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 729 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_job_match_reviews
-- ----------------------------
DROP TABLE IF EXISTS `candidate_job_match_reviews`;
CREATE TABLE `candidate_job_match_reviews`  (
  `review_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_score_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NOT NULL,
  `reviewed_by_user_id` bigint(0) NOT NULL,
  `previous_review_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `new_review_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `previous_decision_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `new_decision_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `decision` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `score_before` decimal(4, 2) NULL DEFAULT NULL,
  `score_after` decimal(4, 2) NULL DEFAULT NULL,
  `changed_fields_json` json NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `idx_match_reviews_score`(`match_score_id`) USING BTREE,
  INDEX `idx_match_reviews_candidate_job`(`candidate_id`, `job_post_id`) USING BTREE,
  INDEX `idx_match_reviews_user`(`reviewed_by_user_id`) USING BTREE,
  INDEX `idx_match_reviews_created`(`created_utc`) USING BTREE,
  INDEX `fk_match_reviews_job_post`(`job_post_id`) USING BTREE,
  CONSTRAINT `fk_match_reviews_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_match_reviews_job_post` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_match_reviews_score` FOREIGN KEY (`match_score_id`) REFERENCES `candidate_job_match_scores` (`match_score_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_match_reviews_user` FOREIGN KEY (`reviewed_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_job_match_score_details
-- ----------------------------
DROP TABLE IF EXISTS `candidate_job_match_score_details`;
CREATE TABLE `candidate_job_match_score_details`  (
  `score_detail_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_score_id` bigint(0) UNSIGNED NOT NULL,
  `criteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcriteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `raw_score` decimal(4, 2) NULL DEFAULT NULL,
  `weighted_score` decimal(6, 4) NULL DEFAULT NULL,
  `weight_percent` decimal(5, 2) NULL DEFAULT NULL,
  `matched_json` json NULL,
  `missing_json` json NULL,
  `evidence_json` json NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`score_detail_id`) USING BTREE,
  UNIQUE INDEX `uq_score_detail_match_criteria_sub`(`match_score_id`, `criteria_key`, `subcriteria_key`) USING BTREE,
  INDEX `idx_score_details_match`(`match_score_id`) USING BTREE,
  INDEX `idx_score_details_criteria`(`criteria_key`, `subcriteria_key`) USING BTREE,
  CONSTRAINT `fk_score_details_match` FOREIGN KEY (`match_score_id`) REFERENCES `candidate_job_match_scores` (`match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_job_match_scores
-- ----------------------------
DROP TABLE IF EXISTS `candidate_job_match_scores`;
CREATE TABLE `candidate_job_match_scores`  (
  `match_score_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NOT NULL,
  `resume_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `parse_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `job_match_extraction_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `scoring_profile_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `scoring_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'resume_match_tree_v1',
  `model_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `has_resume` tinyint(1) NOT NULL DEFAULT 0,
  `resume_priority_boost` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `overall_score` decimal(4, 2) NOT NULL DEFAULT 1.00,
  `skill_score` decimal(4, 2) NULL DEFAULT NULL,
  `experience_score` decimal(4, 2) NULL DEFAULT NULL,
  `responsibility_score` decimal(4, 2) NULL DEFAULT NULL,
  `education_score` decimal(4, 2) NULL DEFAULT NULL,
  `location_score` decimal(4, 2) NULL DEFAULT NULL,
  `application_completeness_score` decimal(4, 2) NULL DEFAULT NULL,
  `core_score` decimal(4, 2) NULL DEFAULT NULL,
  `adjustment_score` decimal(5, 2) NULL DEFAULT NULL,
  `positive_adjustment_points` decimal(5, 2) NULL DEFAULT NULL,
  `negative_penalty_points` decimal(5, 2) NULL DEFAULT NULL,
  `capped_penalty_points` decimal(5, 2) NULL DEFAULT NULL,
  `education_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `role_level_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `work_history_stability_score` decimal(4, 2) NULL DEFAULT NULL,
  `compensation_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `availability_fit_score` decimal(4, 2) NULL DEFAULT NULL,
  `rating_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ai_recommendation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `initial_evaluation_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `initial_evaluation_summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `initial_evaluation_json` json NULL,
  `tree_terminal_node_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tree_terminal_node_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `decision_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'scored_pending_review',
  `recruiter_review_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending_review',
  `recruiter_decision` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recruiter_decision_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reviewed_by_user_id` bigint(0) NULL DEFAULT NULL,
  `reviewed_utc` datetime(0) NULL DEFAULT NULL,
  `revoked_by_user_id` bigint(0) NULL DEFAULT NULL,
  `revoked_utc` datetime(0) NULL DEFAULT NULL,
  `revoke_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `score_explanation` json NULL,
  `score_breakdown_json` json NULL,
  `tree_path_json` json NULL,
  `scoring_config_snapshot` json NULL,
  `review_flags_json` json NULL,
  `point_total_json` json NULL,
  `tolerance_summary_json` json NULL,
  `scored_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`match_score_id`) USING BTREE,
  UNIQUE INDEX `uq_candidate_job_match_current`(`candidate_id`, `job_post_id`, `scoring_version`) USING BTREE,
  INDEX `idx_cjms_job_score`(`job_post_id`, `overall_score`) USING BTREE,
  INDEX `idx_cjms_candidate`(`candidate_id`) USING BTREE,
  INDEX `idx_cjms_office_status_score`(`office_id`, `decision_status`, `overall_score`) USING BTREE,
  INDEX `idx_cjms_review_status`(`recruiter_review_status`, `overall_score`) USING BTREE,
  INDEX `idx_cjms_resume`(`resume_id`) USING BTREE,
  INDEX `idx_cjms_parse`(`parse_id`) USING BTREE,
  INDEX `idx_cjms_scoring_profile`(`scoring_profile_id`) USING BTREE,
  INDEX `idx_cjms_reviewed_by`(`reviewed_by_user_id`) USING BTREE,
  INDEX `idx_cjms_revoked_by`(`revoked_by_user_id`) USING BTREE,
  INDEX `fk_cjms_job_extraction`(`job_match_extraction_id`) USING BTREE,
  INDEX `idx_cjms_candidate_scored_score`(`candidate_id`, `scored_utc`, `overall_score`, `match_score_id`) USING BTREE,
  CONSTRAINT `fk_cjms_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cjms_job_extraction` FOREIGN KEY (`job_match_extraction_id`) REFERENCES `job_post_match_extractions` (`job_match_extraction_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_cjms_job_post` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cjms_parse` FOREIGN KEY (`parse_id`) REFERENCES `candidate_resume_parses` (`parse_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_cjms_resume` FOREIGN KEY (`resume_id`) REFERENCES `candidate_resumes` (`resume_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_cjms_reviewed_by` FOREIGN KEY (`reviewed_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_cjms_revoked_by` FOREIGN KEY (`revoked_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_cjms_scoring_profile` FOREIGN KEY (`scoring_profile_id`) REFERENCES `office_candidate_scoring_profiles` (`scoring_profile_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_job_match_tree_path
-- ----------------------------
DROP TABLE IF EXISTS `candidate_job_match_tree_path`;
CREATE TABLE `candidate_job_match_tree_path`  (
  `tree_path_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_score_id` bigint(0) UNSIGNED NOT NULL,
  `tree_node_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tree_node_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `depth_level` int(0) NOT NULL DEFAULT 0,
  `criteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `criteria_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `matched_condition` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`tree_path_id`) USING BTREE,
  UNIQUE INDEX `uq_tree_path_match_depth_node`(`match_score_id`, `depth_level`, `tree_node_key`) USING BTREE,
  INDEX `idx_tree_path_node`(`tree_node_key`) USING BTREE,
  INDEX `idx_tree_path_match`(`match_score_id`) USING BTREE,
  CONSTRAINT `fk_tree_path_match` FOREIGN KEY (`match_score_id`) REFERENCES `candidate_job_match_scores` (`match_score_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_notes
-- ----------------------------
DROP TABLE IF EXISTS `candidate_notes`;
CREATE TABLE `candidate_notes`  (
  `candidate_note_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `note_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_user_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`candidate_note_id`) USING BTREE,
  INDEX `idx_candidate_notes_candidate_id`(`candidate_id`) USING BTREE,
  INDEX `idx_candidate_notes_created_utc`(`created_utc`) USING BTREE,
  INDEX `idx_candidate_notes_created_by_user_id`(`created_by_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_processing_queue
-- ----------------------------
DROP TABLE IF EXISTS `candidate_processing_queue`;
CREATE TABLE `candidate_processing_queue`  (
  `processing_queue_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NOT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `queue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'resume_score',
  `queue_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `priority` int(0) NOT NULL DEFAULT 100,
  `attempt_count` int(0) NOT NULL DEFAULT 0,
  `max_attempts` int(0) NOT NULL DEFAULT 3,
  `locked_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lock_token` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `locked_utc` datetime(0) NULL DEFAULT NULL,
  `started_utc` datetime(0) NULL DEFAULT NULL,
  `completed_utc` datetime(0) NULL DEFAULT NULL,
  `failed_utc` datetime(0) NULL DEFAULT NULL,
  `last_error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `payload_json` json NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`processing_queue_id`) USING BTREE,
  UNIQUE INDEX `uq_candidate_processing_queue_candidate_job_type`(`candidate_id`, `job_post_id`, `queue_type`) USING BTREE,
  INDEX `idx_processing_queue_status_priority`(`queue_status`, `priority`, `created_utc`) USING BTREE,
  INDEX `idx_processing_queue_candidate_job`(`candidate_id`, `job_post_id`) USING BTREE,
  INDEX `idx_processing_queue_lock_token`(`lock_token`) USING BTREE,
  INDEX `idx_processing_queue_locked`(`locked_by`, `locked_utc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_resume_parses
-- ----------------------------
DROP TABLE IF EXISTS `candidate_resume_parses`;
CREATE TABLE `candidate_resume_parses`  (
  `parse_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `resume_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `parser_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'resume_rules_v1',
  `skill_model_loaded` tinyint(1) NOT NULL DEFAULT 0,
  `model_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parsed_json` json NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zipcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location_parts_json` json NULL,
  `summary_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `skill_years_json` json NULL,
  `work_history_analysis_json` json NULL,
  `education_analysis_json` json NULL,
  `total_experience_months` int(0) NULL DEFAULT NULL,
  `total_experience_years` decimal(6, 2) NULL DEFAULT NULL,
  `average_tenure_months` decimal(6, 2) NULL DEFAULT NULL,
  `short_tenure_count` int(0) NULL DEFAULT NULL,
  `gap_count` int(0) NULL DEFAULT NULL,
  `large_gap_count` int(0) NULL DEFAULT NULL,
  `longest_gap_months` int(0) NULL DEFAULT NULL,
  `stability_score` decimal(4, 2) NULL DEFAULT NULL,
  `highest_degree_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `highest_degree_rank` int(0) NULL DEFAULT NULL,
  `highest_degree_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `work_experience_json` json NULL,
  `education_json` json NULL,
  `certifications_json` json NULL,
  `parse_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'parsed',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`parse_id`) USING BTREE,
  INDEX `idx_candidate_resume_parses_resume`(`resume_id`) USING BTREE,
  INDEX `idx_candidate_resume_parses_candidate`(`candidate_id`) USING BTREE,
  INDEX `idx_candidate_resume_parses_status`(`parse_status`) USING BTREE,
  INDEX `idx_crp_name`(`last_name`, `first_name`) USING BTREE,
  INDEX `idx_crp_location`(`state`, `zipcode`) USING BTREE,
  INDEX `idx_crp_experience`(`total_experience_years`, `stability_score`) USING BTREE,
  INDEX `idx_crp_degree`(`highest_degree_level`, `highest_degree_rank`) USING BTREE,
  CONSTRAINT `fk_candidate_resume_parses_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_candidate_resume_parses_resume` FOREIGN KEY (`resume_id`) REFERENCES `candidate_resumes` (`resume_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_resume_skills
-- ----------------------------
DROP TABLE IF EXISTS `candidate_resume_skills`;
CREATE TABLE `candidate_resume_skills`  (
  `resume_skill_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parse_id` bigint(0) UNSIGNED NOT NULL,
  `resume_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `skill_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `skill_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'rules',
  `confidence_score` decimal(5, 4) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`resume_skill_id`) USING BTREE,
  UNIQUE INDEX `uq_candidate_resume_skill`(`parse_id`, `skill_name`) USING BTREE,
  INDEX `idx_candidate_resume_skills_candidate`(`candidate_id`) USING BTREE,
  INDEX `idx_candidate_resume_skills_skill`(`skill_name`) USING BTREE,
  INDEX `idx_candidate_resume_skills_resume`(`resume_id`) USING BTREE,
  CONSTRAINT `fk_candidate_resume_skills_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_candidate_resume_skills_parse` FOREIGN KEY (`parse_id`) REFERENCES `candidate_resume_parses` (`parse_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_candidate_resume_skills_resume` FOREIGN KEY (`resume_id`) REFERENCES `candidate_resumes` (`resume_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 883 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidate_resumes
-- ----------------------------
DROP TABLE IF EXISTS `candidate_resumes`;
CREATE TABLE `candidate_resumes`  (
  `resume_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `source_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'upload',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_size_bytes` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `raw_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `text_hash` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`resume_id`) USING BTREE,
  INDEX `idx_candidate_resumes_candidate`(`candidate_id`) USING BTREE,
  INDEX `idx_candidate_resumes_active`(`candidate_id`, `is_active`) USING BTREE,
  INDEX `idx_candidate_resumes_text_hash`(`text_hash`) USING BTREE,
  CONSTRAINT `fk_candidate_resumes_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for candidates
-- ----------------------------
DROP TABLE IF EXISTS `candidates`;
CREATE TABLE `candidates`  (
  `candidate_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `external_candidate_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source_applicant_pool_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `account_fk` bigint(0) NULL DEFAULT NULL,
  `job_board_fk` int(0) NULL DEFAULT NULL,
  `jboard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source_system` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zipcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `message_number` int(0) NULL DEFAULT NULL,
  `to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subject` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sent_date` datetime(0) NULL DEFAULT NULL,
  `saved` tinyint(0) NULL DEFAULT NULL,
  `removed` tinyint(0) NULL DEFAULT NULL,
  `processed` tinyint(0) NULL DEFAULT NULL,
  `entered_date` datetime(0) NULL DEFAULT NULL,
  `saved_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `saved_date` datetime(0) NULL DEFAULT NULL,
  `removed_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subject_original` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emailed` tinyint(0) NULL DEFAULT NULL,
  `emailed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emailed_date` datetime(0) NULL DEFAULT NULL,
  `rating` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subject_line_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orig_from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `removed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `removed_date_utc` datetime(0) NULL DEFAULT NULL,
  `resume_points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `account_email_fk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orig_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `processed_by_ai` tinyint(0) NULL DEFAULT NULL,
  `ai_extract_attempt_count` int(0) NULL DEFAULT NULL,
  `utm_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `time_zone_fk` int(0) NOT NULL DEFAULT 1,
  `timezone_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`candidate_id`) USING BTREE,
  INDEX `idx_candidates_email`(`email`) USING BTREE,
  INDEX `idx_candidates_phone`(`phone`) USING BTREE,
  INDEX `idx_candidates_status`(`status`) USING BTREE,
  INDEX `idx_candidates_pop_pre_fk`(`account_fk`) USING BTREE,
  INDEX `idx_candidates_job_board_fk`(`job_board_fk`) USING BTREE,
  INDEX `idx_candidates_source_applicant_pool_id`(`source_applicant_pool_id`) USING BTREE,
  INDEX `idx_candidates_account_created_status`(`account_fk`, `created_utc`, `status`, `candidate_id`) USING BTREE,
  INDEX `idx_candidates_account_created`(`account_fk`, `created_utc`) USING BTREE,
  INDEX `idx_candidates_account_status_created`(`account_fk`, `status`, `created_utc`) USING BTREE,
  CONSTRAINT `fk_candidates_job_board_fk` FOREIGN KEY (`job_board_fk`) REFERENCES `job_boards` (`job_board_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 181445117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for conversation_assignments
-- ----------------------------
DROP TABLE IF EXISTS `conversation_assignments`;
CREATE TABLE `conversation_assignments`  (
  `assignment_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `owner_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `owner_user_id` int(0) NULL DEFAULT NULL,
  `reason_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reason_note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `started_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `ended_utc` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`assignment_id`) USING BTREE,
  INDEX `idx_conversation_assignments_conversation_started`(`conversation_id`, `started_utc`) USING BTREE,
  CONSTRAINT `fk_conversation_assignments_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for conversation_presence
-- ----------------------------
DROP TABLE IF EXISTS `conversation_presence`;
CREATE TABLE `conversation_presence`  (
  `presence_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) NOT NULL,
  `actor_type` enum('candidate','recruiter','ai') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `actor_id` bigint(0) NULL DEFAULT NULL,
  `is_typing` tinyint(0) NULL DEFAULT 0,
  `last_seen_utc` datetime(0) NULL DEFAULT NULL,
  `updated_utc` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`presence_id`) USING BTREE,
  INDEX `idx_conversation`(`conversation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for conversation_turns
-- ----------------------------
DROP TABLE IF EXISTS `conversation_turns`;
CREATE TABLE `conversation_turns`  (
  `turn_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `turn_index` int(0) NOT NULL,
  `sender_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sender_user_id` int(0) NULL DEFAULT NULL,
  `message_text_raw` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `message_text_clean` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `channel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'sms',
  `direction_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `in_reply_to_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `external_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `delivery_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'created',
  `is_system_generated` tinyint(1) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`turn_id`) USING BTREE,
  UNIQUE INDEX `uq_conversation_turns_conversation_turn_index`(`conversation_id`, `turn_index`) USING BTREE,
  INDEX `idx_conversation_turns_conversation_created`(`conversation_id`, `created_utc`) USING BTREE,
  INDEX `idx_conversation_turns_sender_type`(`sender_type`) USING BTREE,
  INDEX `idx_conversation_turns_external_message_id`(`external_message_id`) USING BTREE,
  INDEX `idx_conversation_turns_in_reply_to_turn_id`(`in_reply_to_turn_id`) USING BTREE,
  INDEX `idx_conversation_turns_direction_status`(`direction_type`, `delivery_status`) USING BTREE,
  CONSTRAINT `fk_conversation_turns_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_conversation_turns_in_reply_to_turn_id` FOREIGN KEY (`in_reply_to_turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1995 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for conversations
-- ----------------------------
DROP TABLE IF EXISTS `conversations`;
CREATE TABLE `conversations`  (
  `conversation_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(0) NOT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `current_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'new_lead',
  `control_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'hybrid',
  `current_owner_user_id` bigint(0) NULL DEFAULT NULL,
  `ai_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `flow_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'first_interview',
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `last_inbound_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `last_outbound_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `last_message_utc` datetime(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `closed_utc` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`conversation_id`) USING BTREE,
  INDEX `idx_conversations_candidate_id`(`candidate_id`) USING BTREE,
  INDEX `idx_conversations_job_post_id`(`job_post_id`) USING BTREE,
  INDEX `idx_conversations_state_mode`(`current_state`, `control_mode`) USING BTREE,
  INDEX `idx_conversations_last_message_utc`(`last_message_utc`) USING BTREE,
  INDEX `idx_conversations_account_office`(`account_id`, `office_id`) USING BTREE,
  INDEX `idx_conversations_ai_closed`(`ai_enabled`, `is_closed`) USING BTREE,
  INDEX `idx_conversations_last_inbound_turn_id`(`last_inbound_turn_id`) USING BTREE,
  INDEX `idx_conversations_last_outbound_turn_id`(`last_outbound_turn_id`) USING BTREE,
  INDEX `idx_conversations_current_owner_user_id`(`current_owner_user_id`) USING BTREE,
  CONSTRAINT `fk_conversations_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_conversations_current_owner_user_id` FOREIGN KEY (`current_owner_user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_conversations_job_post_id` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_conversations_last_inbound_turn_id` FOREIGN KEY (`last_inbound_turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_conversations_last_outbound_turn_id` FOREIGN KEY (`last_outbound_turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for handoff_logs
-- ----------------------------
DROP TABLE IF EXISTS `handoff_logs`;
CREATE TABLE `handoff_logs`  (
  `handoff_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `from_owner_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `to_owner_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `from_user_id` int(0) NULL DEFAULT NULL,
  `to_user_id` int(0) NULL DEFAULT NULL,
  `reason_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reason_note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_resolved` tinyint(1) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `resolved_utc` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`handoff_id`) USING BTREE,
  INDEX `idx_handoff_logs_conversation_created`(`conversation_id`, `created_utc`) USING BTREE,
  INDEX `idx_handoff_logs_is_resolved`(`is_resolved`) USING BTREE,
  INDEX `idx_handoff_logs_turn_id`(`turn_id`) USING BTREE,
  CONSTRAINT `fk_handoff_logs_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_handoff_logs_turn_id` FOREIGN KEY (`turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for interview_booking_statuses
-- ----------------------------
DROP TABLE IF EXISTS `interview_booking_statuses`;
CREATE TABLE `interview_booking_statuses`  (
  `booking_status_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`booking_status_id`) USING BTREE,
  UNIQUE INDEX `status_key`(`status_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for interview_bookings
-- ----------------------------
DROP TABLE IF EXISTS `interview_bookings`;
CREATE TABLE `interview_bookings`  (
  `booking_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `interviewer_user_id` bigint(0) NULL DEFAULT NULL,
  `offer_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `round_number` int(0) NOT NULL DEFAULT 1,
  `stage_key` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scheduled_start_local` datetime(0) NOT NULL,
  `scheduled_end_local` datetime(0) NULL DEFAULT NULL,
  `timezone_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `selected_slot_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `booking_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'booked',
  `booking_status_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `zoom_link` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `meeting_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `confirmed_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `cancelled_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `completed_utc` datetime(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`booking_id`) USING BTREE,
  INDEX `idx_interview_bookings_conversation_id`(`conversation_id`) USING BTREE,
  INDEX `idx_interview_bookings_candidate_id`(`candidate_id`) USING BTREE,
  INDEX `idx_interview_bookings_status_start`(`booking_status`, `scheduled_start_local`) USING BTREE,
  INDEX `idx_interview_bookings_job_post_id`(`job_post_id`) USING BTREE,
  INDEX `idx_interview_bookings_offer_id`(`offer_id`) USING BTREE,
  INDEX `idx_interview_bookings_confirmed_turn_id`(`confirmed_turn_id`) USING BTREE,
  INDEX `idx_interview_bookings_cancelled_turn_id`(`cancelled_turn_id`) USING BTREE,
  INDEX `idx_interview_bookings_status_id_start`(`booking_status_id`, `scheduled_start_local`) USING BTREE,
  INDEX `idx_interview_bookings_interviewer_time`(`interviewer_user_id`, `scheduled_start_local`, `scheduled_end_local`) USING BTREE,
  INDEX `idx_interview_bookings_candidate_stage_status`(`candidate_id`, `job_post_id`, `stage_key`, `booking_status_id`) USING BTREE,
  CONSTRAINT `fk_interview_bookings_booking_status_id` FOREIGN KEY (`booking_status_id`) REFERENCES `interview_booking_statuses` (`booking_status_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_bookings_cancelled_turn_id` FOREIGN KEY (`cancelled_turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_bookings_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_bookings_confirmed_turn_id` FOREIGN KEY (`confirmed_turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_bookings_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_bookings_interviewer_user_id` FOREIGN KEY (`interviewer_user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_interview_bookings_job_post_id` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_bookings_offer_id` FOREIGN KEY (`offer_id`) REFERENCES `interview_offers` (`offer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for interview_bookings_backup_before_dedupe
-- ----------------------------
DROP TABLE IF EXISTS `interview_bookings_backup_before_dedupe`;
CREATE TABLE `interview_bookings_backup_before_dedupe`  (
  `booking_id` bigint(0) UNSIGNED NOT NULL DEFAULT 0,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `candidate_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `offer_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `round_number` int(0) NOT NULL DEFAULT 1,
  `scheduled_start_local` datetime(0) NOT NULL,
  `scheduled_end_local` datetime(0) NULL DEFAULT NULL,
  `timezone_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `selected_slot_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `booking_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'booked',
  `zoom_link` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `meeting_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `confirmed_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `cancelled_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `completed_utc` datetime(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for interview_offers
-- ----------------------------
DROP TABLE IF EXISTS `interview_offers`;
CREATE TABLE `interview_offers`  (
  `offer_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `round_number` int(0) NOT NULL DEFAULT 1,
  `offer_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  `offered_slots_json` json NOT NULL,
  `offered_date_local` date NULL DEFAULT NULL,
  `timezone_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `expires_utc` datetime(0) NULL DEFAULT NULL,
  `created_by_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_by_user_id` int(0) NULL DEFAULT NULL,
  `created_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`offer_id`) USING BTREE,
  INDEX `idx_interview_offers_conversation_created`(`conversation_id`, `created_utc`) USING BTREE,
  INDEX `idx_interview_offers_status`(`offer_status`) USING BTREE,
  INDEX `idx_interview_offers_created_turn_id`(`created_turn_id`) USING BTREE,
  CONSTRAINT `fk_interview_offers_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_offers_created_turn_id` FOREIGN KEY (`created_turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_applicant_pool
-- ----------------------------
DROP TABLE IF EXISTS `job_applicant_pool`;
CREATE TABLE `job_applicant_pool`  (
  `applicant_pool_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `external_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `external_source_system` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `external_apply_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_post_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `job_board_id` int(0) NULL DEFAULT NULL,
  `source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_board_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `old_site_job_board_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `message_number` int(0) NULL DEFAULT NULL,
  `to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orig_from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subject` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subject_original` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sent_date` datetime(0) NULL DEFAULT NULL,
  `received_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orig_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orig_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zipcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `has_resume` tinyint(1) NOT NULL DEFAULT 0,
  `resume_file_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resume_original_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resume_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `raw_payload_json` json NULL,
  `saved` tinyint(1) NULL DEFAULT 0,
  `removed` tinyint(1) NOT NULL DEFAULT 0,
  `removed_reason_id` int(0) NULL DEFAULT NULL,
  `removed_reason_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `removed_reason_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `removed_by_user_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `processed_by_ai` tinyint(1) NOT NULL DEFAULT 0,
  `ai_extract_attempt_count` int(0) NOT NULL DEFAULT 0,
  `processed_utc` datetime(0) NULL DEFAULT NULL,
  `applicant_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'new',
  `parse_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'not_started',
  `score_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'not_started',
  `duplicate_applicant_pool_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `promoted_candidate_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `removed_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `removed_by` bigint(0) NULL DEFAULT NULL,
  `removed_utc` datetime(0) NULL DEFAULT NULL,
  `saved_by` bigint(0) NULL DEFAULT NULL,
  `saved_utc` datetime(0) NULL DEFAULT NULL,
  `utm_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `app_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_pool_id`) USING BTREE,
  INDEX `idx_jap_job_status`(`job_post_id`, `applicant_status`, `processed`, `removed`) USING BTREE,
  INDEX `idx_jap_office_status`(`office_id`, `applicant_status`, `processed`) USING BTREE,
  INDEX `idx_jap_account_status`(`account_id`, `applicant_status`, `processed`) USING BTREE,
  INDEX `idx_jap_job_board`(`job_board_id`) USING BTREE,
  INDEX `idx_jap_email`(`email`) USING BTREE,
  INDEX `idx_jap_phone`(`phone`) USING BTREE,
  INDEX `idx_jap_external`(`external_source_system`, `external_id`) USING BTREE,
  INDEX `idx_jap_promoted_candidate`(`promoted_candidate_id`) USING BTREE,
  INDEX `idx_jap_duplicate`(`duplicate_applicant_pool_id`) USING BTREE,
  INDEX `idx_jap_removed_reason`(`removed`, `removed_reason_id`, `removed_utc`) USING BTREE,
  INDEX `fk_jap_removed_reason`(`removed_reason_id`) USING BTREE,
  INDEX `idx_jap_account_removed_received`(`account_id`, `removed`, `received_utc`, `applicant_pool_id`) USING BTREE,
  INDEX `idx_job_applicant_pool_account_removed_received`(`account_id`, `removed`, `received_utc`, `applicant_pool_id`) USING BTREE,
  CONSTRAINT `fk_jap_job_post` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_jap_removed_reason` FOREIGN KEY (`removed_reason_id`) REFERENCES `applicant_remove_reasons` (`reason_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1058 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_applicant_resume_parses
-- ----------------------------
DROP TABLE IF EXISTS `job_applicant_resume_parses`;
CREATE TABLE `job_applicant_resume_parses`  (
  `applicant_parse_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_resume_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `applicant_pool_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `parser_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `skill_model_loaded` tinyint(1) NOT NULL DEFAULT 0,
  `model_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parsed_json` json NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zipcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location_parts_json` json NULL,
  `summary_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `skill_years_json` json NULL,
  `work_history_analysis_json` json NULL,
  `education_analysis_json` json NULL,
  `total_experience_months` int(0) NULL DEFAULT NULL,
  `total_experience_years` decimal(6, 2) NULL DEFAULT NULL,
  `average_tenure_months` decimal(6, 2) NULL DEFAULT NULL,
  `short_tenure_count` int(0) NULL DEFAULT NULL,
  `gap_count` int(0) NULL DEFAULT NULL,
  `large_gap_count` int(0) NULL DEFAULT NULL,
  `longest_gap_months` int(0) NULL DEFAULT NULL,
  `stability_score` decimal(4, 2) NULL DEFAULT NULL,
  `highest_degree_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `highest_degree_rank` int(0) NULL DEFAULT NULL,
  `highest_degree_label` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `work_experience_json` json NULL,
  `education_json` json NULL,
  `certifications_json` json NULL,
  `parse_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'parsed',
  `parse_error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_parse_id`) USING BTREE,
  INDEX `idx_jarp_applicant`(`applicant_pool_id`) USING BTREE,
  INDEX `idx_jarp_resume`(`applicant_resume_id`) USING BTREE,
  INDEX `idx_jarp_job`(`job_post_id`) USING BTREE,
  INDEX `idx_jarp_status`(`parse_status`) USING BTREE,
  CONSTRAINT `fk_jarp_applicant` FOREIGN KEY (`applicant_pool_id`) REFERENCES `job_applicant_pool` (`applicant_pool_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_jarp_job` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_jarp_resume` FOREIGN KEY (`applicant_resume_id`) REFERENCES `job_applicant_resumes` (`applicant_resume_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13759 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_applicant_resume_skills
-- ----------------------------
DROP TABLE IF EXISTS `job_applicant_resume_skills`;
CREATE TABLE `job_applicant_resume_skills`  (
  `applicant_resume_skill_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_parse_id` bigint(0) UNSIGNED NOT NULL,
  `applicant_resume_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `applicant_pool_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `skill_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `skill_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'rules_or_model',
  `confidence_score` decimal(5, 4) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_resume_skill_id`) USING BTREE,
  UNIQUE INDEX `uq_jars_parse_skill`(`applicant_parse_id`, `skill_name`) USING BTREE,
  INDEX `idx_jars_applicant`(`applicant_pool_id`) USING BTREE,
  INDEX `idx_jars_job_skill`(`job_post_id`, `skill_name`) USING BTREE,
  INDEX `idx_jars_skill`(`skill_name`) USING BTREE,
  CONSTRAINT `fk_jars_applicant` FOREIGN KEY (`applicant_pool_id`) REFERENCES `job_applicant_pool` (`applicant_pool_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_jars_job` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_jars_parse` FOREIGN KEY (`applicant_parse_id`) REFERENCES `job_applicant_resume_parses` (`applicant_parse_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5434 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_applicant_resumes
-- ----------------------------
DROP TABLE IF EXISTS `job_applicant_resumes`;
CREATE TABLE `job_applicant_resumes`  (
  `applicant_resume_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `applicant_pool_id` bigint(0) UNSIGNED NOT NULL,
  `job_post_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `resume_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'upload',
  `file_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `original_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size_bytes` bigint(0) NULL DEFAULT NULL,
  `raw_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `parse_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'not_started',
  `parse_error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`applicant_resume_id`) USING BTREE,
  INDEX `idx_jar_applicant`(`applicant_pool_id`, `is_active`) USING BTREE,
  INDEX `idx_jar_job`(`job_post_id`) USING BTREE,
  CONSTRAINT `fk_jar_applicant` FOREIGN KEY (`applicant_pool_id`) REFERENCES `job_applicant_pool` (`applicant_pool_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_jar_job` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_boards
-- ----------------------------
DROP TABLE IF EXISTS `job_boards`;
CREATE TABLE `job_boards`  (
  `job_board_id` int(0) NOT NULL,
  `account_fk` bigint(0) NULL DEFAULT NULL,
  `job_board_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  `sort_order` int(0) NULL DEFAULT 0,
  `job_window_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_by` bigint(0) NULL DEFAULT NULL,
  `removed_by` bigint(0) NULL DEFAULT NULL,
  `removed_date` datetime(0) NULL DEFAULT NULL,
  `auto_process_enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`job_board_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_boards_backup
-- ----------------------------
DROP TABLE IF EXISTS `job_boards_backup`;
CREATE TABLE `job_boards_backup`  (
  `job_board_id` int(0) NOT NULL,
  `account_fk` bigint(0) NULL DEFAULT NULL,
  `job_board_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  `sort_order` int(0) NULL DEFAULT 0,
  `job_window_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_by` bigint(0) NULL DEFAULT NULL,
  `removed_by` bigint(0) NULL DEFAULT NULL,
  `removed_date` datetime(0) NULL DEFAULT NULL,
  `auto_process_enabled` tinyint(1) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_post_match_extractions
-- ----------------------------
DROP TABLE IF EXISTS `job_post_match_extractions`;
CREATE TABLE `job_post_match_extractions`  (
  `job_match_extraction_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `job_post_id` bigint(0) UNSIGNED NOT NULL,
  `extractor_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'job_match_extractor_v1',
  `source_hash` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `required_skills_json` json NULL,
  `preferred_skills_json` json NULL,
  `soft_skills_json` json NULL,
  `job_duties_json` json NULL,
  `education_requirements_json` json NULL,
  `experience_requirements_json` json NULL,
  `location_requirements_json` json NULL,
  `extracted_json` json NOT NULL,
  `extract_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'extracted',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`job_match_extraction_id`) USING BTREE,
  UNIQUE INDEX `uq_job_post_match_extraction_version`(`job_post_id`, `extractor_version`, `source_hash`) USING BTREE,
  INDEX `idx_job_match_extractions_job`(`job_post_id`) USING BTREE,
  INDEX `idx_job_match_extractions_status`(`extract_status`) USING BTREE,
  CONSTRAINT `fk_job_match_extractions_job_post` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`job_post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_posts
-- ----------------------------
DROP TABLE IF EXISTS `job_posts`;
CREATE TABLE `job_posts`  (
  `job_post_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(0) NOT NULL,
  `office_id` int(0) NULL DEFAULT NULL,
  `external_job_post_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `channel_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `workflow_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'standard',
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`job_post_id`) USING BTREE,
  INDEX `idx_job_posts_account_id`(`account_id`) USING BTREE,
  INDEX `idx_job_posts_office_id`(`office_id`) USING BTREE,
  INDEX `idx_job_posts_active`(`active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4558 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_templates
-- ----------------------------
DROP TABLE IF EXISTS `message_templates`;
CREATE TABLE `message_templates`  (
  `template_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `template_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `channel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'sms',
  `flow_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'first_interview',
  `state_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `language_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'en',
  `template_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`template_id`) USING BTREE,
  UNIQUE INDEX `uq_message_templates_template_key`(`template_key`) USING BTREE,
  INDEX `idx_message_templates_flow_state_lang`(`flow_type`, `state_name`, `language_code`) USING BTREE,
  INDEX `idx_message_templates_active`(`active`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nav_items
-- ----------------------------
DROP TABLE IF EXISTS `nav_items`;
CREATE TABLE `nav_items`  (
  `nav_item_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_fk` int(0) UNSIGNED NOT NULL,
  `parent_nav_item_fk` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `item_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location` enum('top','sidebar','both') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'sidebar',
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  `requires_auth` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`nav_item_id`) USING BTREE,
  INDEX `fk_nav_items_menu`(`menu_fk`) USING BTREE,
  INDEX `fk_nav_items_parent`(`parent_nav_item_fk`) USING BTREE,
  CONSTRAINT `fk_nav_items_menu` FOREIGN KEY (`menu_fk`) REFERENCES `nav_menus` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_nav_items_parent` FOREIGN KEY (`parent_nav_item_fk`) REFERENCES `nav_items` (`nav_item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nav_menus
-- ----------------------------
DROP TABLE IF EXISTS `nav_menus`;
CREATE TABLE `nav_menus`  (
  `menu_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `menu_key`(`menu_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office`  (
  `office_id` int(0) NOT NULL,
  `OfficeName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shortOfficeName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ownerName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `innovageCode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `contract_jobboard_fk_lib` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stopped_NonPayment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `stopped_NonPayDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `stopped_NonPayBy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isGrantonOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `grantonUserID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isSCC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isMainOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isSubOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mainOfficeFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isRTOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `RTHeadOfficeFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isRTOfficeNew` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `OfficeCategory` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isLeadsOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isCallList` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isCosmeticOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isAppsOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isAppsEventsOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isChipsOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isCCoffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isGPS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isDigiSign` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isAppco` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isCredico` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `digiSignOnly` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isFWMobile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `phoneswipeUsername` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `phoneswipePassword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `charityTypeFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `selfRecruitStartDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `techComments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `notActiveOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `notActiveMadeDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `onlyReportsMode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `countryID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isFrench` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `primaryTax` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `secondaryTax` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `oldSecondaryTax` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `editTax` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createdBy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fechaCreated` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantumOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `nonPutnamQuantum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantumUSAFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ccAlironOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `grantonNotSignedUp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isDTVOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isSCCEvents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `oldSCCEventOfficeFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isQuantumEvents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sort` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isBillable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `recruitOnly` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `recruitingStartDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `inTechActiveOfficeList` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isUKOverride` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `movedToNewCC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `callListMovedToNewCC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isSccDTVEvents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isBestBuyLILO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isBestBuyLILOOnly` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isSCCHouseManagerAcc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isPrositeDTV` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isPrositeDTVD2D` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isSterlingBackgroundCheck` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isJobBoard` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `oldSiteOfficePK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isJobBoardAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isMeridian` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isMeridianSC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `campaignFK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `arcOfficeID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `timezonefk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isEventShift` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meridianTypeId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isTestOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `OwnerFname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `OwnerLname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `OwnerUserID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `powerlearn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `impact` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isOnBoard` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isTeleCredico` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `robinetteMeridianEnabled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isCanvass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isEventShift2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `infoAve` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tempNoAstream` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `onBoardClientID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isSaraPlus` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `weeklyBilling` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `blockRetire` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isEventShift3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isATTUIDActive` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tableauOnly` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `TeleMapperIsNotify` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `teleMapperSiteId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `nonBillableTestOffice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isInventorySystem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `facial_recognition_enabled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ovilleV2Access` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `officeMFAEnable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `officeMFACanChangeSetting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `standAlone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `powerLearnOnly` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `digitalDocs2FA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isPrositeDTVB2B` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ovilleV1Access` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `useForgetPassword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isTeamHierarchy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isTelemapperD2DEnabled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isTelemapperChatEnabled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isInvoiceEnabled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isCredicoUK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `officeNameAlt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ovClientId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `facialRecognitionTypeId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`office_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_address
-- ----------------------------
DROP TABLE IF EXISTS `office_address`;
CREATE TABLE `office_address`  (
  `address_id` int(0) NOT NULL,
  `office_fk` int(0) NOT NULL,
  `fullName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `zip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fax` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `regAddress1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `regAddress2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `regCity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `regState` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `regZip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `coCode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `coReg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `vatReg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `website` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rcID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `recruitAdminUserID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sendDirectionEmail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `directionEmailFile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `directions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `directionsByOwner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `phone800` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `directionEmailSubject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `directionEmailCC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `directionEmailFromAddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sendAwaitCallEmail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `awaitCallEmailSubject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `awaitCallEmailBody` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `awaitCallTHookEmailBody` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `retailHourlyWage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mailAddress1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mailAddress2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `MailCity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `MailState` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `MailZip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `officeDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `latitudeCapture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `longtitudeCapture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `skipLatLongCheck` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `skipLatLongCheckStaus` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `weekDaysStart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `weekDaysEnd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `saturdayStart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `saturdayEnd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sundayStart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sundayEnd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `distanceFromStoreMeters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `specialInstructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `minBreakTime` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `addressEditDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `locationGPSCapturedDate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cellPhone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `distanceFromStoreMeters_bk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `distanceFromStoreFeet` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `v2WelcomeEmailSubjectLine` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mfaWarningSnoozePeriod` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `idx_office_address_office_fk`(`office_fk`) USING BTREE,
  CONSTRAINT `fk_office_address_office` FOREIGN KEY (`office_fk`) REFERENCES `office` (`office_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_ai_settings
-- ----------------------------
DROP TABLE IF EXISTS `office_ai_settings`;
CREATE TABLE `office_ai_settings`  (
  `office_ai_setting_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `office_id` bigint(0) UNSIGNED NOT NULL,
  `use_default_templates` tinyint(1) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`office_ai_setting_id`) USING BTREE,
  UNIQUE INDEX `uq_office_ai_settings_office_id`(`office_id`) USING BTREE,
  INDEX `idx_office_ai_settings_office_id`(`office_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_candidate_scoring_criteria
-- ----------------------------
DROP TABLE IF EXISTS `office_candidate_scoring_criteria`;
CREATE TABLE `office_candidate_scoring_criteria`  (
  `criteria_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `scoring_profile_id` bigint(0) UNSIGNED NOT NULL,
  `criteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `criteria_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `criteria_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `criteria_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'core',
  `scoring_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'weighted_score',
  `weight_percent` decimal(5, 2) NOT NULL DEFAULT 0.00,
  `max_score` decimal(4, 2) NOT NULL DEFAULT 10.00,
  `max_positive_points` decimal(5, 2) NULL DEFAULT NULL,
  `max_negative_penalty` decimal(5, 2) NULL DEFAULT NULL,
  `default_tolerance_value` decimal(8, 2) NULL DEFAULT NULL,
  `default_tolerance_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `allow_compensation` tinyint(1) NOT NULL DEFAULT 1,
  `is_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `review_flag_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `scoring_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`criteria_id`) USING BTREE,
  UNIQUE INDEX `uq_scoring_criteria_profile_key`(`scoring_profile_id`, `criteria_key`) USING BTREE,
  INDEX `idx_scoring_criteria_profile`(`scoring_profile_id`, `is_enabled`, `sort_order`) USING BTREE,
  CONSTRAINT `fk_scoring_criteria_profile` FOREIGN KEY (`scoring_profile_id`) REFERENCES `office_candidate_scoring_profiles` (`scoring_profile_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1791 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_candidate_scoring_profiles
-- ----------------------------
DROP TABLE IF EXISTS `office_candidate_scoring_profiles`;
CREATE TABLE `office_candidate_scoring_profiles`  (
  `scoring_profile_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `office_id` int(0) NOT NULL,
  `profile_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Default Candidate Scoring',
  `profile_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 1,
  `scoring_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'tree_and_weighted',
  `max_tree_depth` int(0) NOT NULL DEFAULT 3,
  `min_parent_cases` int(0) NOT NULL DEFAULT 25,
  `min_child_cases` int(0) NOT NULL DEFAULT 10,
  `require_recruiter_approval_before_invite` tinyint(1) NOT NULL DEFAULT 1,
  `auto_invite_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_score_to_recommend` decimal(4, 2) NOT NULL DEFAULT 7.00,
  `minimum_score_to_invite` decimal(4, 2) NOT NULL DEFAULT 7.50,
  `review_required_below_score` decimal(4, 2) NOT NULL DEFAULT 6.00,
  `resume_priority_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `resume_priority_boost` decimal(4, 2) NOT NULL DEFAULT 0.50,
  `no_resume_max_score` decimal(4, 2) NOT NULL DEFAULT 6.50,
  `max_auto_invites_per_job_per_day` int(0) NOT NULL DEFAULT 25,
  `created_by_user_id` bigint(0) NULL DEFAULT NULL,
  `updated_by_user_id` bigint(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`scoring_profile_id`) USING BTREE,
  INDEX `idx_scoring_profiles_office`(`office_id`) USING BTREE,
  INDEX `idx_scoring_profiles_default`(`office_id`, `is_default`, `is_enabled`) USING BTREE,
  INDEX `idx_scoring_profiles_created_by`(`created_by_user_id`) USING BTREE,
  INDEX `idx_scoring_profiles_updated_by`(`updated_by_user_id`) USING BTREE,
  CONSTRAINT `fk_scoring_profiles_created_by` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_scoring_profiles_office` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_scoring_profiles_updated_by` FOREIGN KEY (`updated_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_candidate_scoring_rating_rules
-- ----------------------------
DROP TABLE IF EXISTS `office_candidate_scoring_rating_rules`;
CREATE TABLE `office_candidate_scoring_rating_rules`  (
  `rating_rule_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `scoring_profile_id` bigint(0) UNSIGNED NOT NULL,
  `rating_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rating_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ai_recommendation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `min_score` decimal(4, 2) NOT NULL,
  `max_score` decimal(4, 2) NOT NULL,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`rating_rule_id`) USING BTREE,
  UNIQUE INDEX `uq_rating_rule_profile_key`(`scoring_profile_id`, `rating_key`) USING BTREE,
  INDEX `idx_rating_rule_profile_score`(`scoring_profile_id`, `min_score`, `max_score`) USING BTREE,
  CONSTRAINT `fk_rating_rule_profile` FOREIGN KEY (`scoring_profile_id`) REFERENCES `office_candidate_scoring_profiles` (`scoring_profile_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1537 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_candidate_scoring_subcriteria
-- ----------------------------
DROP TABLE IF EXISTS `office_candidate_scoring_subcriteria`;
CREATE TABLE `office_candidate_scoring_subcriteria`  (
  `subcriteria_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `criteria_id` bigint(0) UNSIGNED NOT NULL,
  `subcriteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcriteria_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcriteria_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `subcriteria_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'core',
  `scoring_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ratio',
  `weight_percent` decimal(5, 2) NOT NULL DEFAULT 0.00,
  `max_score` decimal(4, 2) NOT NULL DEFAULT 10.00,
  `max_positive_points` decimal(5, 2) NULL DEFAULT NULL,
  `full_match_points` decimal(5, 2) NULL DEFAULT NULL,
  `partial_match_points` decimal(5, 2) NULL DEFAULT NULL,
  `missing_penalty` decimal(5, 2) NULL DEFAULT NULL,
  `max_negative_penalty` decimal(5, 2) NULL DEFAULT NULL,
  `tolerance_value` decimal(8, 2) NULL DEFAULT NULL,
  `tolerance_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `allow_compensation` tinyint(1) NOT NULL DEFAULT 1,
  `is_disqualifier` tinyint(1) NOT NULL DEFAULT 0,
  `review_flag_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `scoring_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`subcriteria_id`) USING BTREE,
  UNIQUE INDEX `uq_scoring_subcriteria_criteria_key`(`criteria_id`, `subcriteria_key`) USING BTREE,
  INDEX `idx_scoring_subcriteria_criteria`(`criteria_id`, `is_enabled`, `sort_order`) USING BTREE,
  CONSTRAINT `fk_scoring_subcriteria_criteria` FOREIGN KEY (`criteria_id`) REFERENCES `office_candidate_scoring_criteria` (`criteria_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3579 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_candidate_scoring_tree_nodes
-- ----------------------------
DROP TABLE IF EXISTS `office_candidate_scoring_tree_nodes`;
CREATE TABLE `office_candidate_scoring_tree_nodes`  (
  `tree_node_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `scoring_profile_id` bigint(0) UNSIGNED NOT NULL,
  `node_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_node_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `node_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `node_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `depth_level` int(0) NOT NULL DEFAULT 0,
  `sort_order` int(0) NOT NULL DEFAULT 0,
  `criteria_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operator_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `compare_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `compare_min` decimal(8, 2) NULL DEFAULT NULL,
  `compare_max` decimal(8, 2) NULL DEFAULT NULL,
  `condition_json` json NULL,
  `is_terminal` tinyint(1) NOT NULL DEFAULT 0,
  `predicted_score` decimal(4, 2) NULL DEFAULT NULL,
  `score_min` decimal(4, 2) NULL DEFAULT NULL,
  `score_max` decimal(4, 2) NULL DEFAULT NULL,
  `rating_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ai_recommendation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`tree_node_id`) USING BTREE,
  UNIQUE INDEX `uq_tree_node_profile_key`(`scoring_profile_id`, `node_key`) USING BTREE,
  INDEX `idx_tree_nodes_profile_parent`(`scoring_profile_id`, `parent_node_key`) USING BTREE,
  INDEX `idx_tree_nodes_terminal`(`scoring_profile_id`, `is_terminal`) USING BTREE,
  INDEX `idx_tree_nodes_depth`(`scoring_profile_id`, `depth_level`, `sort_order`) USING BTREE,
  CONSTRAINT `fk_tree_nodes_profile` FOREIGN KEY (`scoring_profile_id`) REFERENCES `office_candidate_scoring_profiles` (`scoring_profile_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3329 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_interview_schedule_blackouts
-- ----------------------------
DROP TABLE IF EXISTS `office_interview_schedule_blackouts`;
CREATE TABLE `office_interview_schedule_blackouts`  (
  `blackout_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `schedule_profile_id` bigint(0) UNSIGNED NOT NULL,
  `start_local_datetime` datetime(0) NOT NULL,
  `end_local_datetime` datetime(0) NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`blackout_id`) USING BTREE,
  INDEX `idx_sched_blackouts_profile_start`(`schedule_profile_id`, `start_local_datetime`, `is_active`) USING BTREE,
  CONSTRAINT `fk_sched_blackouts_profile_id` FOREIGN KEY (`schedule_profile_id`) REFERENCES `office_interview_schedule_profiles` (`schedule_profile_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_interview_schedule_holidays
-- ----------------------------
DROP TABLE IF EXISTS `office_interview_schedule_holidays`;
CREATE TABLE `office_interview_schedule_holidays`  (
  `holiday_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `schedule_profile_id` bigint(0) UNSIGNED NOT NULL,
  `holiday_date` date NOT NULL,
  `holiday_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`holiday_id`) USING BTREE,
  UNIQUE INDEX `uq_sched_holiday_profile_date`(`schedule_profile_id`, `holiday_date`) USING BTREE,
  INDEX `idx_sched_holidays_active`(`is_active`) USING BTREE,
  CONSTRAINT `fk_sched_holidays_profile_id` FOREIGN KEY (`schedule_profile_id`) REFERENCES `office_interview_schedule_profiles` (`schedule_profile_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_interview_schedule_profiles
-- ----------------------------
DROP TABLE IF EXISTS `office_interview_schedule_profiles`;
CREATE TABLE `office_interview_schedule_profiles`  (
  `schedule_profile_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `office_id` int(0) NOT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `profile_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Default Interview Schedule',
  `timezone_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slot_interval_minutes` int(0) NOT NULL DEFAULT 15,
  `interview_duration_minutes` int(0) NOT NULL DEFAULT 30,
  `max_weekly_interviews` int(0) NOT NULL DEFAULT 0 COMMENT '0 = no limit',
  `booking_horizon_days` int(0) NOT NULL DEFAULT 14 COMMENT 'How far ahead AI can offer slots',
  `minimum_notice_hours` int(0) NOT NULL DEFAULT 12 COMMENT 'Prevent last-minute auto offers',
  `allow_weekends` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`schedule_profile_id`) USING BTREE,
  INDEX `idx_sched_profiles_office_id`(`office_id`) USING BTREE,
  INDEX `idx_sched_profiles_account_id`(`account_id`) USING BTREE,
  INDEX `idx_sched_profiles_active`(`is_active`) USING BTREE,
  CONSTRAINT `fk_sched_profiles_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sched_profiles_office_id` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for office_interview_schedule_windows
-- ----------------------------
DROP TABLE IF EXISTS `office_interview_schedule_windows`;
CREATE TABLE `office_interview_schedule_windows`  (
  `schedule_window_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `schedule_profile_id` bigint(0) UNSIGNED NOT NULL,
  `day_of_week` tinyint(0) NOT NULL COMMENT '1=Monday ... 7=Sunday',
  `start_local_time` time(0) NOT NULL,
  `end_local_time` time(0) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`schedule_window_id`) USING BTREE,
  INDEX `idx_sched_windows_profile_day`(`schedule_profile_id`, `day_of_week`, `is_active`) USING BTREE,
  CONSTRAINT `fk_sched_windows_profile_id` FOREIGN KEY (`schedule_profile_id`) REFERENCES `office_interview_schedule_profiles` (`schedule_profile_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1025 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recruiter_flow_profiles
-- ----------------------------
DROP TABLE IF EXISTS `recruiter_flow_profiles`;
CREATE TABLE `recruiter_flow_profiles`  (
  `flow_profile_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `user_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `flow_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `flow_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`flow_profile_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recruiter_flow_steps
-- ----------------------------
DROP TABLE IF EXISTS `recruiter_flow_steps`;
CREATE TABLE `recruiter_flow_steps`  (
  `flow_step_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flow_profile_id` bigint(0) UNSIGNED NOT NULL,
  `step_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `step_order` int(0) NOT NULL,
  `step_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `template_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `next_step_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`flow_step_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recruiter_message_templates
-- ----------------------------
DROP TABLE IF EXISTS `recruiter_message_templates`;
CREATE TABLE `recruiter_message_templates`  (
  `template_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `scope_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'system|office',
  `office_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(0) NULL DEFAULT NULL,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `template_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `template_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `template_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `channel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `flow_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`template_id`) USING BTREE,
  INDEX `idx_rmt_scope_lookup`(`scope_type`, `account_id`, `user_id`, `template_key`, `is_active`) USING BTREE,
  INDEX `idx_rmt_template_key`(`template_key`) USING BTREE,
  INDEX `idx_rmt_account_id`(`account_id`) USING BTREE,
  INDEX `idx_rmt_user_id`(`user_id`) USING BTREE,
  INDEX `idx_rmt_office_lookup`(`scope_type`, `office_id`, `template_key`, `is_active`) USING BTREE,
  CONSTRAINT `fk_rmt_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rmt_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reminder_logs
-- ----------------------------
DROP TABLE IF EXISTS `reminder_logs`;
CREATE TABLE `reminder_logs`  (
  `reminder_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `booking_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `reminder_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scheduled_utc` datetime(0) NULL DEFAULT NULL,
  `sent_utc` datetime(0) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'queued',
  `note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`reminder_id`) USING BTREE,
  INDEX `idx_reminder_logs_conversation_id`(`conversation_id`) USING BTREE,
  INDEX `idx_reminder_logs_booking_id`(`booking_id`) USING BTREE,
  INDEX `idx_reminder_logs_turn_id`(`turn_id`) USING BTREE,
  INDEX `idx_reminder_logs_status_scheduled`(`status`, `scheduled_utc`) USING BTREE,
  CONSTRAINT `fk_reminder_logs_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `interview_bookings` (`booking_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reminder_logs_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reminder_logs_turn_id` FOREIGN KEY (`turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for staging_job_posts_clean
-- ----------------------------
DROP TABLE IF EXISTS `staging_job_posts_clean`;
CREATE TABLE `staging_job_posts_clean`  (
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `channel_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for state_transitions
-- ----------------------------
DROP TABLE IF EXISTS `state_transitions`;
CREATE TABLE `state_transitions`  (
  `transition_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(0) UNSIGNED NOT NULL,
  `from_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `to_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reason_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reason_note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `trigger_turn_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `triggered_by_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `triggered_by_user_id` int(0) NULL DEFAULT NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`transition_id`) USING BTREE,
  INDEX `idx_state_transitions_conversation_created`(`conversation_id`, `created_utc`) USING BTREE,
  INDEX `idx_state_transitions_to_state`(`to_state`) USING BTREE,
  INDEX `idx_state_transitions_trigger_turn_id`(`trigger_turn_id`) USING BTREE,
  CONSTRAINT `fk_state_transitions_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_state_transitions_trigger_turn_id` FOREIGN KEY (`trigger_turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1039 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for template_variables
-- ----------------------------
DROP TABLE IF EXISTS `template_variables`;
CREATE TABLE `template_variables`  (
  `variable_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variable_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `display_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `example_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`variable_id`) USING BTREE,
  UNIQUE INDEX `uq_template_variables_key`(`variable_key`) USING BTREE,
  INDEX `idx_template_variables_active`(`is_active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for timezones
-- ----------------------------
DROP TABLE IF EXISTS `timezones`;
CREATE TABLE `timezones`  (
  `timezone_id` int(0) NOT NULL,
  `timezone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`timezone_id`) USING BTREE,
  UNIQUE INDEX `uk_timezones_timezone`(`timezone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for turn_analysis
-- ----------------------------
DROP TABLE IF EXISTS `turn_analysis`;
CREATE TABLE `turn_analysis`  (
  `analysis_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `turn_id` bigint(0) UNSIGNED NOT NULL,
  `model_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state_before` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `predicted_intent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `intent_confidence` decimal(6, 5) NULL DEFAULT NULL,
  `predicted_next_action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `next_action_confidence` decimal(6, 5) NULL DEFAULT NULL,
  `entities_json` json NULL,
  `use_local` tinyint(1) NOT NULL DEFAULT 0,
  `requires_handoff` tinyint(1) NOT NULL DEFAULT 0,
  `fallback_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `raw_model_response_json` json NULL,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`analysis_id`) USING BTREE,
  INDEX `idx_turn_analysis_turn_id`(`turn_id`) USING BTREE,
  INDEX `idx_turn_analysis_intent`(`predicted_intent`) USING BTREE,
  INDEX `idx_turn_analysis_next_action`(`predicted_next_action`) USING BTREE,
  INDEX `idx_turn_analysis_requires_handoff`(`requires_handoff`) USING BTREE,
  INDEX `idx_turn_analysis_source`(`source`) USING BTREE,
  CONSTRAINT `fk_turn_analysis_turn_id` FOREIGN KEY (`turn_id`) REFERENCES `conversation_turns` (`turn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 999 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_page_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_page_permission`;
CREATE TABLE `user_page_permission`  (
  `permission_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) UNSIGNED NOT NULL,
  `nav_item_id` bigint(0) UNSIGNED NOT NULL,
  `can_view` tinyint(1) NOT NULL DEFAULT 0,
  `can_create` tinyint(1) NOT NULL DEFAULT 0,
  `can_update` tinyint(1) NOT NULL DEFAULT 0,
  `can_delete` tinyint(1) NOT NULL DEFAULT 0,
  `can_manage` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `uq_user_page_permission_role_nav`(`role_id`, `nav_item_id`) USING BTREE,
  INDEX `idx_user_page_permission_role`(`role_id`) USING BTREE,
  INDEX `idx_user_page_permission_nav_item`(`nav_item_id`) USING BTREE,
  INDEX `idx_user_page_permission_active_view`(`is_active`, `can_view`) USING BTREE,
  CONSTRAINT `fk_user_page_permission_nav_item` FOREIGN KEY (`nav_item_id`) REFERENCES `nav_items` (`nav_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_page_permission_role` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `role_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_utc` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_utc` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uq_user_roles_role_key`(`role_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint(0) NOT NULL,
  `account_fk` bigint(0) NULL DEFAULT NULL,
  `role_id` bigint(0) UNSIGNED NOT NULL DEFAULT 1,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ov_user_id` bigint(0) NOT NULL DEFAULT 0,
  `ov_user_id_portugal` bigint(0) NOT NULL DEFAULT 0,
  `my_promo_user_id` bigint(0) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `sms_out_phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `theme` tinyint(1) NOT NULL DEFAULT 0,
  `is_1024` tinyint(1) NOT NULL DEFAULT 0,
  `full_activity_report` tinyint(1) NOT NULL DEFAULT 0,
  `sterling_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sterling_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_by` bigint(0) NOT NULL DEFAULT 0,
  `created_date` datetime(3) NULL DEFAULT NULL,
  `modified_by` bigint(0) NOT NULL DEFAULT 0,
  `modify_date` datetime(3) NULL DEFAULT NULL,
  `removed_by` bigint(0) NOT NULL DEFAULT 0,
  `removed_date` datetime(3) NULL DEFAULT NULL,
  `removed_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `new_terms_agreed` tinyint(1) NOT NULL DEFAULT 0,
  `new_terms_response_date` datetime(3) NULL DEFAULT NULL,
  `device_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `app_activated` tinyint(1) NOT NULL DEFAULT 0,
  `device_token2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_date2` datetime(3) NULL DEFAULT NULL,
  `modify_date2` datetime(3) NULL DEFAULT NULL,
  `removed_date2` datetime(3) NULL DEFAULT NULL,
  `privacy_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `privacy_accepted_date` datetime(3) NULL DEFAULT NULL,
  `admin_id` bigint(0) NULL DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `enabled_2fa` tinyint(1) NOT NULL DEFAULT 0,
  `hide_sms_chat` tinyint(1) NULL DEFAULT 0,
  `v2_theme_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `ai_messaging` tinyint(1) NULL DEFAULT 0,
  `ai_sms_automation` tinyint(1) NULL DEFAULT 0,
  `ai_extraction` tinyint(1) NOT NULL DEFAULT 0,
  `auto_processing` tinyint(1) NOT NULL DEFAULT 0,
  `ai_usage` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `idx_users_account_fk`(`account_fk`) USING BTREE,
  INDEX `idx_users_email`(`email`) USING BTREE,
  INDEX `idx_users_username`(`username`) USING BTREE,
  INDEX `idx_users_active`(`active`) USING BTREE,
  INDEX `idx_users_created_by`(`created_by`) USING BTREE,
  INDEX `idx_users_admin_id`(`admin_id`) USING BTREE,
  INDEX `idx_users_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for vw_candidate_match_adjustment_review
-- ----------------------------
DROP VIEW IF EXISTS `vw_candidate_match_adjustment_review`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_candidate_match_adjustment_review` AS select `a`.`adjustment_id` AS `adjustment_id`,`a`.`match_score_id` AS `match_score_id`,`s`.`candidate_id` AS `candidate_id`,`s`.`job_post_id` AS `job_post_id`,`a`.`adjustment_key` AS `adjustment_key`,`a`.`adjustment_label` AS `adjustment_label`,`a`.`adjustment_category` AS `adjustment_category`,`a`.`adjustment_direction` AS `adjustment_direction`,`a`.`raw_adjustment_points` AS `raw_adjustment_points`,`a`.`applied_adjustment_points` AS `applied_adjustment_points`,`a`.`max_positive_points` AS `max_positive_points`,`a`.`max_negative_penalty` AS `max_negative_penalty`,`a`.`score_before_adjustment` AS `score_before_adjustment`,`a`.`score_after_adjustment` AS `score_after_adjustment`,`a`.`review_flag` AS `review_flag`,`a`.`is_disqualifier` AS `is_disqualifier`,`a`.`triggered_disqualifier` AS `triggered_disqualifier`,`a`.`reason_text` AS `reason_text`,`a`.`sort_order` AS `sort_order`,`a`.`created_utc` AS `created_utc` from (`candidate_job_match_adjustments` `a` join `candidate_job_match_scores` `s` on((`s`.`match_score_id` = `a`.`match_score_id`)));

-- ----------------------------
-- View structure for vw_candidate_match_recruiter_review
-- ----------------------------
DROP VIEW IF EXISTS `vw_candidate_match_recruiter_review`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_candidate_match_recruiter_review` AS select `s`.`match_score_id` AS `match_score_id`,`s`.`candidate_id` AS `candidate_id`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`c`.`email` AS `email`,`c`.`phone` AS `phone`,`s`.`job_post_id` AS `job_post_id`,`jp`.`job_title` AS `job_title`,`jp`.`job_location` AS `job_location`,`s`.`office_id` AS `office_id`,`s`.`account_id` AS `account_id`,`s`.`has_resume` AS `has_resume`,`s`.`overall_score` AS `overall_score`,`s`.`skill_score` AS `skill_score`,`s`.`experience_score` AS `experience_score`,`s`.`responsibility_score` AS `responsibility_score`,`s`.`education_score` AS `education_score`,`s`.`location_score` AS `location_score`,`s`.`rating_label` AS `rating_label`,`s`.`ai_recommendation` AS `ai_recommendation`,`s`.`tree_terminal_node_key` AS `tree_terminal_node_key`,`s`.`tree_terminal_node_label` AS `tree_terminal_node_label`,`s`.`decision_status` AS `decision_status`,`s`.`recruiter_review_status` AS `recruiter_review_status`,`s`.`recruiter_decision` AS `recruiter_decision`,`s`.`reviewed_by_user_id` AS `reviewed_by_user_id`,`s`.`reviewed_utc` AS `reviewed_utc`,`s`.`scored_utc` AS `scored_utc`,`q`.`queue_id` AS `queue_id`,`q`.`queue_status` AS `queue_status`,`q`.`priority_rank` AS `priority_rank`,`q`.`sent_conversation_id` AS `sent_conversation_id`,`q`.`sent_utc` AS `sent_utc` from (((`candidate_job_match_scores` `s` join `candidates` `c` on((`c`.`candidate_id` = `s`.`candidate_id`))) join `job_posts` `jp` on((`jp`.`job_post_id` = `s`.`job_post_id`))) left join `candidate_invitation_queue` `q` on((`q`.`match_score_id` = `s`.`match_score_id`)));

-- ----------------------------
-- View structure for vw_candidate_match_recruiter_review_v2
-- ----------------------------
DROP VIEW IF EXISTS `vw_candidate_match_recruiter_review_v2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_candidate_match_recruiter_review_v2` AS select `s`.`match_score_id` AS `match_score_id`,`s`.`candidate_id` AS `candidate_id`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`c`.`email` AS `email`,`c`.`phone` AS `phone`,`s`.`job_post_id` AS `job_post_id`,`jp`.`job_title` AS `job_title`,`jp`.`job_location` AS `job_location`,`s`.`office_id` AS `office_id`,`s`.`account_id` AS `account_id`,`s`.`has_resume` AS `has_resume`,`s`.`resume_id` AS `resume_id`,`s`.`parse_id` AS `parse_id`,`s`.`overall_score` AS `overall_score`,`s`.`core_score` AS `core_score`,`s`.`adjustment_score` AS `adjustment_score`,`s`.`positive_adjustment_points` AS `positive_adjustment_points`,`s`.`negative_penalty_points` AS `negative_penalty_points`,`s`.`capped_penalty_points` AS `capped_penalty_points`,`s`.`skill_score` AS `skill_score`,`s`.`experience_score` AS `experience_score`,`s`.`responsibility_score` AS `responsibility_score`,`s`.`education_score` AS `education_score`,`s`.`education_fit_score` AS `education_fit_score`,`s`.`location_score` AS `location_score`,`s`.`role_level_fit_score` AS `role_level_fit_score`,`s`.`work_history_stability_score` AS `work_history_stability_score`,`s`.`compensation_fit_score` AS `compensation_fit_score`,`s`.`availability_fit_score` AS `availability_fit_score`,`s`.`rating_label` AS `rating_label`,`s`.`ai_recommendation` AS `ai_recommendation`,`s`.`initial_evaluation_label` AS `initial_evaluation_label`,`s`.`initial_evaluation_summary` AS `initial_evaluation_summary`,`s`.`initial_evaluation_json` AS `initial_evaluation_json`,`s`.`tree_terminal_node_key` AS `tree_terminal_node_key`,`s`.`tree_terminal_node_label` AS `tree_terminal_node_label`,`s`.`decision_status` AS `decision_status`,`s`.`recruiter_review_status` AS `recruiter_review_status`,`s`.`recruiter_decision` AS `recruiter_decision`,`s`.`reviewed_by_user_id` AS `reviewed_by_user_id`,`s`.`reviewed_utc` AS `reviewed_utc`,(select count(0) from `candidate_job_match_review_flags` `rf` where ((`rf`.`match_score_id` = `s`.`match_score_id`) and (`rf`.`is_resolved` = 0))) AS `open_review_flag_count`,(select count(0) from `candidate_job_match_requirement_evaluations` `re` where ((`re`.`match_score_id` = `s`.`match_score_id`) and (`re`.`match_result` in ('missing','below_requirement')))) AS `requirement_gap_count`,`q`.`queue_id` AS `queue_id`,`q`.`queue_status` AS `queue_status`,`q`.`priority_rank` AS `priority_rank`,`q`.`sent_conversation_id` AS `sent_conversation_id`,`q`.`sent_utc` AS `sent_utc`,`s`.`scored_utc` AS `scored_utc`,`s`.`created_utc` AS `created_utc`,`s`.`updated_utc` AS `updated_utc` from (((`candidate_job_match_scores` `s` join `candidates` `c` on((`c`.`candidate_id` = `s`.`candidate_id`))) join `job_posts` `jp` on((`jp`.`job_post_id` = `s`.`job_post_id`))) left join `candidate_invitation_queue` `q` on((`q`.`match_score_id` = `s`.`match_score_id`)));

-- ----------------------------
-- View structure for vw_candidate_match_requirement_checklist
-- ----------------------------
DROP VIEW IF EXISTS `vw_candidate_match_requirement_checklist`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_candidate_match_requirement_checklist` AS select `r`.`requirement_eval_id` AS `requirement_eval_id`,`r`.`match_score_id` AS `match_score_id`,`s`.`candidate_id` AS `candidate_id`,`s`.`job_post_id` AS `job_post_id`,`r`.`criteria_key` AS `criteria_key`,`r`.`subcriteria_key` AS `subcriteria_key`,`r`.`requirement_type` AS `requirement_type`,`r`.`requirement_key` AS `requirement_key`,`r`.`requirement_label` AS `requirement_label`,`r`.`job_required_value` AS `job_required_value`,`r`.`job_required_unit` AS `job_required_unit`,`r`.`candidate_value` AS `candidate_value`,`r`.`candidate_unit` AS `candidate_unit`,`r`.`match_result` AS `match_result`,`r`.`match_strength` AS `match_strength`,`r`.`points_possible` AS `points_possible`,`r`.`points_earned` AS `points_earned`,`r`.`penalty_possible` AS `penalty_possible`,`r`.`penalty_applied` AS `penalty_applied`,`r`.`tolerance_value` AS `tolerance_value`,`r`.`tolerance_unit` AS `tolerance_unit`,`r`.`within_tolerance` AS `within_tolerance`,`r`.`review_flag` AS `review_flag`,`r`.`is_disqualifier` AS `is_disqualifier`,`r`.`triggered_disqualifier` AS `triggered_disqualifier`,`r`.`candidate_evidence_text` AS `candidate_evidence_text`,`r`.`notes` AS `notes`,`r`.`sort_order` AS `sort_order`,`r`.`created_utc` AS `created_utc` from (`candidate_job_match_requirement_evaluations` `r` join `candidate_job_match_scores` `s` on((`s`.`match_score_id` = `r`.`match_score_id`)));

-- ----------------------------
-- View structure for vw_candidate_match_tree_gain_summary
-- ----------------------------
DROP VIEW IF EXISTS `vw_candidate_match_tree_gain_summary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_candidate_match_tree_gain_summary` AS select `s`.`scoring_profile_id` AS `scoring_profile_id`,`s`.`job_post_id` AS `job_post_id`,`s`.`office_id` AS `office_id`,`s`.`tree_terminal_node_key` AS `tree_terminal_node_key`,`s`.`tree_terminal_node_label` AS `tree_terminal_node_label`,count(0) AS `candidate_count`,round(avg(`s`.`overall_score`),2) AS `avg_score`,round(min(`s`.`overall_score`),2) AS `min_score`,round(max(`s`.`overall_score`),2) AS `max_score`,sum((case when (`s`.`recruiter_review_status` = 'approved') then 1 else 0 end)) AS `approved_count`,sum((case when (`s`.`recruiter_review_status` = 'rejected') then 1 else 0 end)) AS `rejected_count`,sum((case when (`s`.`recruiter_review_status` = 'revoked') then 1 else 0 end)) AS `revoked_count`,round(((100 * sum((case when (`s`.`recruiter_review_status` = 'approved') then 1 else 0 end))) / nullif(count(0),0)),2) AS `recruiter_approval_percent` from `candidate_job_match_scores` `s` group by `s`.`scoring_profile_id`,`s`.`job_post_id`,`s`.`office_id`,`s`.`tree_terminal_node_key`,`s`.`tree_terminal_node_label`;

-- ----------------------------
-- Procedure structure for reset_canidate
-- ----------------------------
DROP PROCEDURE IF EXISTS `reset_canidate`;
delimiter ;;
CREATE PROCEDURE `reset_canidate`()
BEGIN
  SET @db := DATABASE();
  SET @fallback_office_id := 23438;

  -- =======================================================
  -- 1) Allow applicant intake rows without job_post_id.
  --    Queue/score tables stay job-bound; unmapped applicants are not queued.
  -- =======================================================

  SET FOREIGN_KEY_CHECKS = 0;

  -- job_applicant_pool.job_post_id nullable
  SET @table_exists := (
    SELECT COUNT(*) FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'job_applicant_pool'
  );

  SET @fk_name := (
    SELECT CONSTRAINT_NAME
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_pool'
      AND COLUMN_NAME = 'job_post_id'
      AND REFERENCED_TABLE_NAME = 'job_posts'
    LIMIT 1
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_name IS NOT NULL,
    CONCAT('ALTER TABLE job_applicant_pool DROP FOREIGN KEY `', @fk_name, '`'),
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @sql := IF(
    @table_exists > 0,
    'ALTER TABLE job_applicant_pool MODIFY job_post_id bigint UNSIGNED NULL DEFAULT NULL',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @fk_exists := (
    SELECT COUNT(*)
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_pool'
      AND CONSTRAINT_NAME = 'fk_jap_job_post'
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_exists = 0,
    'ALTER TABLE job_applicant_pool ADD CONSTRAINT fk_jap_job_post FOREIGN KEY (job_post_id) REFERENCES job_posts(job_post_id) ON DELETE SET NULL ON UPDATE RESTRICT',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


  -- job_applicant_resumes.job_post_id nullable
  SET @table_exists := (
    SELECT COUNT(*) FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'job_applicant_resumes'
  );

  SET @fk_name := (
    SELECT CONSTRAINT_NAME
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_resumes'
      AND COLUMN_NAME = 'job_post_id'
      AND REFERENCED_TABLE_NAME = 'job_posts'
    LIMIT 1
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_name IS NOT NULL,
    CONCAT('ALTER TABLE job_applicant_resumes DROP FOREIGN KEY `', @fk_name, '`'),
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @sql := IF(
    @table_exists > 0,
    'ALTER TABLE job_applicant_resumes MODIFY job_post_id bigint UNSIGNED NULL DEFAULT NULL',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @fk_exists := (
    SELECT COUNT(*)
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_resumes'
      AND CONSTRAINT_NAME = 'fk_jar_job'
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_exists = 0,
    'ALTER TABLE job_applicant_resumes ADD CONSTRAINT fk_jar_job FOREIGN KEY (job_post_id) REFERENCES job_posts(job_post_id) ON DELETE SET NULL ON UPDATE RESTRICT',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


  -- job_applicant_resume_parses.job_post_id nullable
  SET @table_exists := (
    SELECT COUNT(*) FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'job_applicant_resume_parses'
  );

  SET @fk_name := (
    SELECT CONSTRAINT_NAME
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_resume_parses'
      AND COLUMN_NAME = 'job_post_id'
      AND REFERENCED_TABLE_NAME = 'job_posts'
    LIMIT 1
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_name IS NOT NULL,
    CONCAT('ALTER TABLE job_applicant_resume_parses DROP FOREIGN KEY `', @fk_name, '`'),
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @sql := IF(
    @table_exists > 0,
    'ALTER TABLE job_applicant_resume_parses MODIFY job_post_id bigint UNSIGNED NULL DEFAULT NULL',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @fk_exists := (
    SELECT COUNT(*)
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_resume_parses'
      AND CONSTRAINT_NAME = 'fk_jarp_job'
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_exists = 0,
    'ALTER TABLE job_applicant_resume_parses ADD CONSTRAINT fk_jarp_job FOREIGN KEY (job_post_id) REFERENCES job_posts(job_post_id) ON DELETE SET NULL ON UPDATE RESTRICT',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


  -- job_applicant_resume_skills.job_post_id nullable
  SET @table_exists := (
    SELECT COUNT(*) FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = @db AND TABLE_NAME = 'job_applicant_resume_skills'
  );

  SET @fk_name := (
    SELECT CONSTRAINT_NAME
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_resume_skills'
      AND COLUMN_NAME = 'job_post_id'
      AND REFERENCED_TABLE_NAME = 'job_posts'
    LIMIT 1
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_name IS NOT NULL,
    CONCAT('ALTER TABLE job_applicant_resume_skills DROP FOREIGN KEY `', @fk_name, '`'),
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @sql := IF(
    @table_exists > 0,
    'ALTER TABLE job_applicant_resume_skills MODIFY job_post_id bigint UNSIGNED NULL DEFAULT NULL',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET @fk_exists := (
    SELECT COUNT(*)
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = @db
      AND TABLE_NAME = 'job_applicant_resume_skills'
      AND CONSTRAINT_NAME = 'fk_jars_job'
  );

  SET @sql := IF(
    @table_exists > 0 AND @fk_exists = 0,
    'ALTER TABLE job_applicant_resume_skills ADD CONSTRAINT fk_jars_job FOREIGN KEY (job_post_id) REFERENCES job_posts(job_post_id) ON DELETE SET NULL ON UPDATE RESTRICT',
    'SELECT 1'
  );
  PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

  SET FOREIGN_KEY_CHECKS = 1;


  -- =======================================================
  -- 2) Candidate -> applicant map.
  --    Existing job_post_id wins.
  --    If missing, assign random job_post_id from office_id = 23438.
  -- =======================================================

  DROP TEMPORARY TABLE IF EXISTS tmp_reset_candidate_map;

  CREATE TEMPORARY TABLE tmp_reset_candidate_map (
    candidate_id bigint UNSIGNED NOT NULL PRIMARY KEY,
    original_office_id int NULL,
    final_office_id int NULL,
    account_id int NULL,
    original_job_post_id bigint UNSIGNED NULL,
    random_office_job_post_id bigint UNSIGNED NULL,
    job_post_id bigint UNSIGNED NULL,
    job_post_assignment_source varchar(50) NULL,
    has_resume tinyint(1) NOT NULL DEFAULT 0,
    latest_resume_id bigint UNSIGNED NULL,
    applicant_pool_id bigint UNSIGNED NULL
  ) ENGINE=Memory;

  INSERT INTO tmp_reset_candidate_map
  (
    candidate_id,
    original_office_id,
    final_office_id,
    account_id,
    original_job_post_id,
    random_office_job_post_id,
    job_post_id,
    job_post_assignment_source,
    has_resume,
    latest_resume_id
  )
  SELECT
    c.candidate_id,
    acc.officeFK AS original_office_id,
    @fallback_office_id AS final_office_id,
    c.account_fk AS account_id,

    COALESCE(
      (
        SELECT cjms.job_post_id
        FROM candidate_job_match_scores cjms
        WHERE cjms.candidate_id = c.candidate_id
          AND cjms.job_post_id IS NOT NULL
        ORDER BY cjms.updated_utc DESC, cjms.match_score_id DESC
        LIMIT 1
      ),
      (
        SELECT ciq.job_post_id
        FROM candidate_invitation_queue ciq
        WHERE ciq.candidate_id = c.candidate_id
          AND ciq.job_post_id IS NOT NULL
        ORDER BY ciq.updated_utc DESC, ciq.queue_id DESC
        LIMIT 1
      ),
      (
        SELECT conv.job_post_id
        FROM conversations conv
        WHERE conv.candidate_id = c.candidate_id
          AND conv.job_post_id IS NOT NULL
        ORDER BY conv.updated_utc DESC, conv.conversation_id DESC
        LIMIT 1
      ),
      (
        SELECT ib.job_post_id
        FROM interview_bookings ib
        WHERE ib.candidate_id = c.candidate_id
          AND ib.job_post_id IS NOT NULL
        ORDER BY ib.updated_utc DESC, ib.booking_id DESC
        LIMIT 1
      )
    ) AS original_job_post_id,

    (
      SELECT jp2.job_post_id
      FROM job_posts jp2
      WHERE jp2.office_id = @fallback_office_id
      ORDER BY RAND()
      LIMIT 1
    ) AS random_office_job_post_id,

    COALESCE(
      (
        SELECT cjms.job_post_id
        FROM candidate_job_match_scores cjms
        WHERE cjms.candidate_id = c.candidate_id
          AND cjms.job_post_id IS NOT NULL
        ORDER BY cjms.updated_utc DESC, cjms.match_score_id DESC
        LIMIT 1
      ),
      (
        SELECT ciq.job_post_id
        FROM candidate_invitation_queue ciq
        WHERE ciq.candidate_id = c.candidate_id
          AND ciq.job_post_id IS NOT NULL
        ORDER BY ciq.updated_utc DESC, ciq.queue_id DESC
        LIMIT 1
      ),
      (
        SELECT conv.job_post_id
        FROM conversations conv
        WHERE conv.candidate_id = c.candidate_id
          AND conv.job_post_id IS NOT NULL
        ORDER BY conv.updated_utc DESC, conv.conversation_id DESC
        LIMIT 1
      ),
      (
        SELECT ib.job_post_id
        FROM interview_bookings ib
        WHERE ib.candidate_id = c.candidate_id
          AND ib.job_post_id IS NOT NULL
        ORDER BY ib.updated_utc DESC, ib.booking_id DESC
        LIMIT 1
      ),
      (
        SELECT jp2.job_post_id
        FROM job_posts jp2
        WHERE jp2.office_id = @fallback_office_id
        ORDER BY RAND()
        LIMIT 1
      )
    ) AS final_job_post_id,

    CASE
      WHEN COALESCE(
        (
          SELECT cjms.job_post_id
          FROM candidate_job_match_scores cjms
          WHERE cjms.candidate_id = c.candidate_id
            AND cjms.job_post_id IS NOT NULL
          ORDER BY cjms.updated_utc DESC, cjms.match_score_id DESC
          LIMIT 1
        ),
        (
          SELECT ciq.job_post_id
          FROM candidate_invitation_queue ciq
          WHERE ciq.candidate_id = c.candidate_id
            AND ciq.job_post_id IS NOT NULL
          ORDER BY ciq.updated_utc DESC, ciq.queue_id DESC
          LIMIT 1
        ),
        (
          SELECT conv.job_post_id
          FROM conversations conv
          WHERE conv.candidate_id = c.candidate_id
            AND conv.job_post_id IS NOT NULL
          ORDER BY conv.updated_utc DESC, conv.conversation_id DESC
          LIMIT 1
        ),
        (
          SELECT ib.job_post_id
          FROM interview_bookings ib
          WHERE ib.candidate_id = c.candidate_id
            AND ib.job_post_id IS NOT NULL
          ORDER BY ib.updated_utc DESC, ib.booking_id DESC
          LIMIT 1
        )
      ) IS NOT NULL THEN 'existing'
      WHEN (
        SELECT jp2.job_post_id
        FROM job_posts jp2
        WHERE jp2.office_id = @fallback_office_id
        ORDER BY RAND()
        LIMIT 1
      ) IS NOT NULL THEN 'random_office_23438'
      ELSE 'needs_job_mapping'
    END AS job_post_assignment_source,

    CASE
      WHEN EXISTS (
        SELECT 1
        FROM candidate_resumes cr
        WHERE cr.candidate_id = c.candidate_id
          AND cr.is_active = 1
        LIMIT 1
      ) THEN 1
      ELSE 0
    END AS has_resume,

    (
      SELECT cr.resume_id
      FROM candidate_resumes cr
      WHERE cr.candidate_id = c.candidate_id
      ORDER BY cr.is_active DESC, cr.updated_utc DESC, cr.resume_id DESC
      LIMIT 1
    ) AS latest_resume_id

  FROM candidates c
  LEFT JOIN accounts acc
    ON acc.account_id = c.account_fk;


  -- =======================================================
  -- 3) Flush applicant-side rows from previous tests.
  -- =======================================================

  SET FOREIGN_KEY_CHECKS = 0;

  CALL _jp_delete_table_if_exists('applicant_job_match_review_flags');
  CALL _jp_delete_table_if_exists('applicant_job_match_adjustments');
  CALL _jp_delete_table_if_exists('applicant_job_match_requirement_evaluations');
  CALL _jp_delete_table_if_exists('applicant_job_match_scores');

  CALL _jp_delete_table_if_exists('job_applicant_resume_skills');
  CALL _jp_delete_table_if_exists('job_applicant_resume_parses');
  CALL _jp_delete_table_if_exists('job_applicant_resumes');

  CALL _jp_delete_table_if_exists('applicant_processing_queue');
  CALL _jp_delete_table_if_exists('job_applicant_pool');

  SET FOREIGN_KEY_CHECKS = 1;


  -- =======================================================
  -- 4) Put everyone into applicant pool.
  -- =======================================================

  INSERT INTO job_applicant_pool
  (
    external_id,
    external_source_system,
    external_apply_id,

    job_post_id,
    office_id,
    account_id,
    job_board_id,
    source_name,
    job_board_original,

    message_number,
    to_address,
    from_address,
    orig_from_address,
    subject,
    subject_original,
    sent_date,
    received_utc,

    first_name,
    last_name,
    full_name,
    phone,
    orig_phone,
    email,
    orig_email,
    zipcode,

    has_resume,
    resume_file_path,
    resume_original_filename,
    resume_text,

    raw_payload_json,

    saved,
    removed,
    processed,
    processed_by_ai,
    ai_extract_attempt_count,
    applicant_status,
    parse_status,
    score_status,

    utm_source,
    created_utc,
    updated_utc
  )
  SELECT
    CONCAT('candidate:', c.candidate_id) AS external_id,
    'candidate_hard_reset' AS external_source_system,
    c.external_candidate_id AS external_apply_id,

    m.job_post_id,
    COALESCE(jp.office_id, m.final_office_id) AS office_id,
    COALESCE(jp.account_id, m.account_id) AS account_id,
    c.job_board_fk,
    COALESCE(NULLIF(c.source_system, ''), NULLIF(c.jboard, ''), 'candidate_reset') AS source_name,
    c.jboard AS job_board_original,

    c.message_number,
    c.to_address,
    c.from_address,
    c.orig_from_address,
    c.subject,
    c.subject_original,
    c.sent_date,
    COALESCE(c.created_utc, UTC_TIMESTAMP()) AS received_utc,

    c.first_name,
    c.last_name,
    NULLIF(TRIM(CONCAT_WS(' ', c.first_name, c.last_name)), '') AS full_name,
    c.phone,
    c.orig_phone,
    c.email,
    c.email AS orig_email,
    c.zipcode,

    m.has_resume,
    cr.file_path,
    cr.original_file_name,
    cr.raw_text,

    JSON_OBJECT(
      'reset_source', 'reset_canidate',
      'fallback_office_id', @fallback_office_id,
      'old_candidate_id', c.candidate_id,
      'old_external_candidate_id', c.external_candidate_id,
      'old_status', c.status,
      'old_source_system', c.source_system,
      'old_job_board_fk', c.job_board_fk,
      'old_account_fk', c.account_fk,
      'original_office_id', m.original_office_id,
      'final_office_id', COALESCE(jp.office_id, m.final_office_id),
      'original_job_post_id', m.original_job_post_id,
      'random_office_job_post_id', m.random_office_job_post_id,
      'final_job_post_id', m.job_post_id,
      'job_post_assignment_source', m.job_post_assignment_source,
      'needs_job_mapping', IF(m.job_post_id IS NULL, true, false),
      'reset_utc', UTC_TIMESTAMP()
    ) AS raw_payload_json,

    0 AS saved,
    0 AS removed,
    0 AS processed,
    0 AS processed_by_ai,
    0 AS ai_extract_attempt_count,

    CASE
      WHEN m.job_post_id IS NULL THEN 'needs_job_mapping'
      ELSE 'new'
    END AS applicant_status,
    CASE
      WHEN m.job_post_id IS NULL THEN 'blocked'
      ELSE 'not_started'
    END AS parse_status,
    CASE
      WHEN m.job_post_id IS NULL THEN 'blocked'
      ELSE 'not_started'
    END AS score_status,

    c.utm_source,
    UTC_TIMESTAMP(),
    UTC_TIMESTAMP()
  FROM tmp_reset_candidate_map m
  INNER JOIN candidates c
    ON c.candidate_id = m.candidate_id
  LEFT JOIN job_posts jp
    ON jp.job_post_id = m.job_post_id
  LEFT JOIN candidate_resumes cr
    ON cr.resume_id = m.latest_resume_id;


  UPDATE tmp_reset_candidate_map m
  INNER JOIN job_applicant_pool jap
    ON jap.external_source_system = 'candidate_hard_reset'
   AND jap.external_id = CONCAT('candidate:', m.candidate_id)
  SET m.applicant_pool_id = jap.applicant_pool_id;


  -- =======================================================
  -- 5) Copy candidate resumes into applicant resumes.
  -- =======================================================

  INSERT INTO job_applicant_resumes
  (
    applicant_pool_id,
    job_post_id,
    resume_source,
    file_path,
    original_filename,
    mime_type,
    size_bytes,
    raw_text,
    is_active,
    parse_status,
    created_utc,
    updated_utc
  )
  SELECT
    m.applicant_pool_id,
    m.job_post_id,
    COALESCE(cr.source_type, 'candidate_reset') AS resume_source,
    cr.file_path,
    cr.original_file_name,
    cr.file_mime_type,
    cr.file_size_bytes,
    cr.raw_text,
    cr.is_active,
    CASE
      WHEN m.job_post_id IS NULL THEN 'blocked'
      ELSE 'not_started'
    END AS parse_status,
    UTC_TIMESTAMP(),
    UTC_TIMESTAMP()
  FROM candidate_resumes cr
  INNER JOIN tmp_reset_candidate_map m
    ON m.candidate_id = cr.candidate_id
  WHERE m.applicant_pool_id IS NOT NULL;


  -- =======================================================
  -- 6) Queue mapped applicants only.
  -- =======================================================

  INSERT INTO applicant_processing_queue
  (
    applicant_pool_id,
    job_post_id,
    office_id,
    account_id,
    queue_type,
    queue_status,
    priority,
    attempt_count,
    max_attempts,
    payload_json,
    created_utc,
    updated_utc
  )
  SELECT
    jap.applicant_pool_id,
    jap.job_post_id,
    jap.office_id,
    jap.account_id,
    'resume_score',
    'pending',
    CASE WHEN jap.has_resume = 1 THEN 10 ELSE 100 END,
    0,
    3,
    JSON_OBJECT(
      'source', 'reset_canidate',
      'fallback_office_id', @fallback_office_id,
      'old_candidate_external_id', jap.external_id
    ),
    UTC_TIMESTAMP(),
    UTC_TIMESTAMP()
  FROM job_applicant_pool jap
  WHERE jap.job_post_id IS NOT NULL;


  -- =======================================================
  -- 7) Flush candidate-side runtime/pipeline rows.
  -- =======================================================

  SET FOREIGN_KEY_CHECKS = 0;

  CALL _jp_delete_table_if_exists('candidate_invitation_queue_events');
  CALL _jp_delete_table_if_exists('candidate_invitation_queue');

  CALL _jp_delete_table_if_exists('candidate_job_match_reviews');
  CALL _jp_delete_table_if_exists('candidate_job_match_tree_path');
  CALL _jp_delete_table_if_exists('candidate_job_match_score_details');
  CALL _jp_delete_table_if_exists('candidate_job_match_review_flags');
  CALL _jp_delete_table_if_exists('candidate_job_match_adjustments');
  CALL _jp_delete_table_if_exists('candidate_job_match_requirement_evaluations');
  CALL _jp_delete_table_if_exists('candidate_job_match_scores');

  CALL _jp_delete_table_if_exists('candidate_processing_queue');

  CALL _jp_delete_table_if_exists('candidate_resume_skills');
  CALL _jp_delete_table_if_exists('candidate_resume_parses');
  CALL _jp_delete_table_if_exists('candidate_resumes');

  CALL _jp_delete_table_if_exists('reminder_logs');
  CALL _jp_delete_table_if_exists('interview_bookings');
  CALL _jp_delete_table_if_exists('interview_offers');

  CALL _jp_delete_table_if_exists('candidate_chat_verifications');
  CALL _jp_delete_table_if_exists('candidate_chat_tokens');

  CALL _jp_delete_table_if_exists('conversation_presence');
  CALL _jp_delete_table_if_exists('turn_analysis');
  CALL _jp_delete_table_if_exists('handoff_logs');
  CALL _jp_delete_table_if_exists('state_transitions');
  CALL _jp_delete_table_if_exists('conversation_assignments');
  CALL _jp_delete_table_if_exists('conversation_turns');
  CALL _jp_delete_table_if_exists('conversations');

  CALL _jp_delete_table_if_exists('candidates');

  SET FOREIGN_KEY_CHECKS = 1;


  -- =======================================================
  -- 8) Final report.
  -- =======================================================

  SELECT
    (SELECT COUNT(*) FROM candidates) AS candidates_remaining,
    (SELECT COUNT(*) FROM job_applicant_pool) AS applicant_pool_total,
    (SELECT COUNT(*) FROM job_applicant_pool WHERE job_post_id IS NOT NULL) AS applicant_pool_mapped_to_job,
    (SELECT COUNT(*) FROM job_applicant_pool WHERE job_post_id IS NULL) AS applicant_pool_needs_job_mapping,
    (SELECT COUNT(*) FROM applicant_processing_queue WHERE queue_status = 'pending') AS applicant_queue_pending,
    (SELECT COUNT(*) FROM job_applicant_resumes) AS applicant_resume_rows,
    (SELECT COUNT(*) FROM job_applicant_pool WHERE JSON_UNQUOTE(JSON_EXTRACT(raw_payload_json, '$.job_post_assignment_source')) = 'existing') AS kept_existing_job_post_count,
    (SELECT COUNT(*) FROM job_applicant_pool WHERE JSON_UNQUOTE(JSON_EXTRACT(raw_payload_json, '$.job_post_assignment_source')) = 'random_office_23438') AS random_office_23438_job_post_count;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_applicant_processing_claim_jobs
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_applicant_processing_claim_jobs`;
delimiter ;;
CREATE PROCEDURE `sp_applicant_processing_claim_jobs`(IN p_worker_id varchar(100),
  IN p_batch_limit int,
  IN p_stale_minutes int)
BEGIN
  DECLARE v_batch_limit int DEFAULT 50;
  DECLARE v_stale_minutes int DEFAULT 30;
  DECLARE v_lock_token char(36);

  SET v_batch_limit = CASE
    WHEN p_batch_limit IS NULL OR p_batch_limit < 1 THEN 50
    WHEN p_batch_limit > 250 THEN 250
    ELSE p_batch_limit
  END;

  SET v_stale_minutes = CASE
    WHEN p_stale_minutes IS NULL OR p_stale_minutes < 5 THEN 30
    ELSE p_stale_minutes
  END;

  SET v_lock_token = UUID();

  START TRANSACTION;

  UPDATE applicant_processing_queue
  SET
    queue_status = CASE
      WHEN attempt_count >= max_attempts THEN 'failed'
      ELSE 'retry'
    END,
    locked_by = NULL,
    lock_token = NULL,
    locked_utc = NULL,
    failed_utc = CASE
      WHEN attempt_count >= max_attempts THEN UTC_TIMESTAMP()
      ELSE failed_utc
    END,
    last_error_message = CASE
      WHEN attempt_count >= max_attempts THEN COALESCE(last_error_message, 'Processing lock expired.')
      ELSE last_error_message
    END,
    updated_utc = UTC_TIMESTAMP()
  WHERE queue_status = 'processing'
    AND locked_utc IS NOT NULL
    AND locked_utc < DATE_SUB(UTC_TIMESTAMP(), INTERVAL v_stale_minutes MINUTE);

  UPDATE applicant_processing_queue
  SET
    queue_status = 'processing',
    locked_by = p_worker_id,
    lock_token = v_lock_token,
    locked_utc = UTC_TIMESTAMP(),
    started_utc = UTC_TIMESTAMP(),
    completed_utc = NULL,
    failed_utc = NULL,
    attempt_count = attempt_count + 1,
    updated_utc = UTC_TIMESTAMP()
  WHERE queue_status IN ('pending', 'retry')
    AND attempt_count < max_attempts
  ORDER BY priority ASC, created_utc ASC
  LIMIT v_batch_limit;

  UPDATE job_applicant_pool jap
  JOIN applicant_processing_queue q
    ON q.applicant_pool_id = jap.applicant_pool_id
  SET
    jap.applicant_status = 'processing',
    jap.updated_utc = UTC_TIMESTAMP()
  WHERE q.lock_token = v_lock_token;

  COMMIT;

  SELECT
    q.processing_queue_id,
    q.applicant_pool_id,
    q.job_post_id,
    q.office_id,
    q.account_id,
    q.queue_type,
    q.queue_status,
    q.priority,
    q.attempt_count,
    q.max_attempts,
    q.locked_by,
    q.lock_token,
    q.locked_utc,
    q.payload_json
  FROM applicant_processing_queue q
  WHERE q.lock_token = v_lock_token
  ORDER BY q.priority ASC, q.created_utc ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_applicant_processing_enqueue
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_applicant_processing_enqueue`;
delimiter ;;
CREATE PROCEDURE `sp_applicant_processing_enqueue`(IN p_applicant_pool_id bigint UNSIGNED,
  IN p_queue_type varchar(50),
  IN p_payload_json json)
BEGIN
  DECLARE v_job_post_id bigint UNSIGNED;
  DECLARE v_office_id int;
  DECLARE v_account_id int;
  DECLARE v_has_resume tinyint DEFAULT 0;
  DECLARE v_queue_type varchar(50);
  DECLARE v_priority int;

  SELECT
    jap.job_post_id,
    COALESCE(jap.office_id, jp.office_id),
    COALESCE(jap.account_id, jp.account_id),
    COALESCE(jap.has_resume, 0)
  INTO
    v_job_post_id,
    v_office_id,
    v_account_id,
    v_has_resume
  FROM job_applicant_pool jap
  JOIN job_posts jp ON jp.job_post_id = jap.job_post_id
  WHERE jap.applicant_pool_id = p_applicant_pool_id
  LIMIT 1;

  IF v_job_post_id IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Applicant pool row not found or missing job_post_id.';
  END IF;

  SET v_queue_type = COALESCE(NULLIF(p_queue_type, ''), 'resume_score');

  -- Lower number = higher priority.
  SET v_priority = CASE
    WHEN v_has_resume = 1 THEN 10
    ELSE 100
  END;

  INSERT INTO applicant_processing_queue
  (
    applicant_pool_id,
    job_post_id,
    office_id,
    account_id,
    queue_type,
    queue_status,
    priority,
    attempt_count,
    max_attempts,
    locked_by,
    lock_token,
    locked_utc,
    started_utc,
    completed_utc,
    failed_utc,
    last_error_message,
    payload_json
  )
  VALUES
  (
    p_applicant_pool_id,
    v_job_post_id,
    v_office_id,
    v_account_id,
    v_queue_type,
    'pending',
    v_priority,
    0,
    3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    p_payload_json
  )
  ON DUPLICATE KEY UPDATE
    office_id = VALUES(office_id),
    account_id = VALUES(account_id),
    priority = LEAST(priority, VALUES(priority)),
    payload_json = VALUES(payload_json),
    queue_status = CASE
      WHEN queue_status = 'processing' THEN queue_status
      ELSE 'pending'
    END,
    last_error_message = CASE
      WHEN queue_status = 'processing' THEN last_error_message
      ELSE NULL
    END,
    failed_utc = CASE
      WHEN queue_status = 'processing' THEN failed_utc
      ELSE NULL
    END,
    updated_utc = UTC_TIMESTAMP();

  UPDATE job_applicant_pool
  SET
    applicant_status = CASE
      WHEN applicant_status IN ('new', 'failed', 'retry') THEN 'queued'
      ELSE applicant_status
    END,
    parse_status = CASE
      WHEN parse_status IN ('not_started', 'failed') THEN 'queued'
      ELSE parse_status
    END,
    score_status = CASE
      WHEN score_status IN ('not_started', 'failed') THEN 'queued'
      ELSE score_status
    END,
    updated_utc = UTC_TIMESTAMP()
  WHERE applicant_pool_id = p_applicant_pool_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_applicant_processing_enqueue_new_arrivals
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_applicant_processing_enqueue_new_arrivals`;
delimiter ;;
CREATE PROCEDURE `sp_applicant_processing_enqueue_new_arrivals`(IN p_batch_limit int)
BEGIN
  DECLARE v_batch_limit int DEFAULT 50;
  DECLARE v_selected_count int DEFAULT 0;

  SET v_batch_limit = CASE
    WHEN p_batch_limit IS NULL OR p_batch_limit < 1 THEN 50
    WHEN p_batch_limit > 250 THEN 250
    ELSE p_batch_limit
  END;

  DROP TEMPORARY TABLE IF EXISTS tmp_applicant_new_arrivals;
  CREATE TEMPORARY TABLE tmp_applicant_new_arrivals (
    applicant_pool_id bigint UNSIGNED NOT NULL PRIMARY KEY,
    job_post_id bigint UNSIGNED NOT NULL,
    office_id int NULL,
    account_id int NULL,
    priority int NOT NULL
  ) ENGINE = MEMORY;

  INSERT INTO tmp_applicant_new_arrivals
  (
    applicant_pool_id,
    job_post_id,
    office_id,
    account_id,
    priority
  )
  SELECT
    jap.applicant_pool_id,
    jap.job_post_id,
    COALESCE(jap.office_id, jp.office_id) AS office_id,
    COALESCE(jap.account_id, jp.account_id) AS account_id,
    CASE WHEN COALESCE(jap.has_resume, 0) = 1 THEN 10 ELSE 100 END AS priority
  FROM job_applicant_pool jap
  JOIN job_posts jp
    ON jp.job_post_id = jap.job_post_id
  LEFT JOIN applicant_processing_queue q
    ON q.applicant_pool_id = jap.applicant_pool_id
   AND q.job_post_id = jap.job_post_id
   AND q.queue_type = 'resume_score'
  WHERE jap.removed = 0
    AND jap.job_post_id IS NOT NULL
    AND jap.promoted_candidate_id IS NULL
    AND q.processing_queue_id IS NULL
    AND jap.score_status IN ('not_started', 'failed')
    AND jap.applicant_status IN ('new', 'failed', 'retry')
  ORDER BY jap.received_utc ASC, jap.applicant_pool_id ASC
  LIMIT v_batch_limit;

  SELECT COUNT(*) INTO v_selected_count FROM tmp_applicant_new_arrivals;

  INSERT INTO applicant_processing_queue
  (
    applicant_pool_id,
    job_post_id,
    office_id,
    account_id,
    queue_type,
    queue_status,
    priority,
    attempt_count,
    max_attempts,
    locked_by,
    lock_token,
    locked_utc,
    started_utc,
    completed_utc,
    failed_utc,
    last_error_message,
    payload_json
  )
  SELECT
    t.applicant_pool_id,
    t.job_post_id,
    t.office_id,
    t.account_id,
    'resume_score',
    'pending',
    t.priority,
    0,
    3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    JSON_OBJECT('enqueue_source', 'sp_applicant_processing_enqueue_new_arrivals')
  FROM tmp_applicant_new_arrivals t;

  UPDATE job_applicant_pool jap
  JOIN tmp_applicant_new_arrivals t
    ON t.applicant_pool_id = jap.applicant_pool_id
  SET
    jap.applicant_status = 'queued',
    jap.parse_status = CASE
      WHEN jap.parse_status IN ('not_started', 'failed') THEN 'queued'
      ELSE jap.parse_status
    END,
    jap.score_status = CASE
      WHEN jap.score_status IN ('not_started', 'failed') THEN 'queued'
      ELSE jap.score_status
    END,
    jap.updated_utc = UTC_TIMESTAMP();

  SELECT v_selected_count AS queued_count;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_applicant_processing_mark_completed
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_applicant_processing_mark_completed`;
delimiter ;;
CREATE PROCEDURE `sp_applicant_processing_mark_completed`(IN p_processing_queue_id bigint UNSIGNED,
  IN p_lock_token char(36))
BEGIN
  UPDATE applicant_processing_queue q
  JOIN job_applicant_pool jap
    ON jap.applicant_pool_id = q.applicant_pool_id
  SET
    q.queue_status = 'completed',
    q.completed_utc = UTC_TIMESTAMP(),
    q.locked_by = NULL,
    q.lock_token = NULL,
    q.locked_utc = NULL,
    q.last_error_message = NULL,
    q.updated_utc = UTC_TIMESTAMP(),
    jap.applicant_status = 'processed',
    jap.processed = 1,
    jap.processed_by_ai = 1,
    jap.processed_utc = UTC_TIMESTAMP(),
    jap.parse_status = 'parsed',
    jap.score_status = 'scored',
    jap.updated_utc = UTC_TIMESTAMP()
  WHERE q.processing_queue_id = p_processing_queue_id
    AND q.lock_token = p_lock_token;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_applicant_processing_mark_failed
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_applicant_processing_mark_failed`;
delimiter ;;
CREATE PROCEDURE `sp_applicant_processing_mark_failed`(IN p_processing_queue_id bigint UNSIGNED,
  IN p_lock_token char(36),
  IN p_error_message text)
BEGIN
  UPDATE applicant_processing_queue q
  JOIN job_applicant_pool jap
    ON jap.applicant_pool_id = q.applicant_pool_id
  SET
    q.queue_status = CASE
      WHEN q.attempt_count >= q.max_attempts THEN 'failed'
      ELSE 'retry'
    END,
    q.failed_utc = UTC_TIMESTAMP(),
    q.locked_by = NULL,
    q.lock_token = NULL,
    q.locked_utc = NULL,
    q.last_error_message = p_error_message,
    q.updated_utc = UTC_TIMESTAMP(),
    jap.applicant_status = CASE
      WHEN q.attempt_count >= q.max_attempts THEN 'failed'
      ELSE 'retry'
    END,
    jap.ai_extract_attempt_count = COALESCE(jap.ai_extract_attempt_count, 0) + 1,
    jap.parse_status = CASE
      WHEN q.attempt_count >= q.max_attempts THEN 'failed'
      ELSE jap.parse_status
    END,
    jap.score_status = CASE
      WHEN q.attempt_count >= q.max_attempts THEN 'failed'
      ELSE jap.score_status
    END,
    jap.updated_utc = UTC_TIMESTAMP()
  WHERE q.processing_queue_id = p_processing_queue_id
    AND q.lock_token = p_lock_token;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_applicant_processing_promote_scored_to_candidates
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_applicant_processing_promote_scored_to_candidates`;
delimiter ;;
CREATE PROCEDURE `sp_applicant_processing_promote_scored_to_candidates`(IN p_batch_limit int)
BEGIN
  DECLARE v_done int DEFAULT 0;
  DECLARE v_batch_limit int DEFAULT 50;

  DECLARE v_applicant_pool_id bigint UNSIGNED;
  DECLARE v_applicant_match_score_id bigint UNSIGNED;
  DECLARE v_job_post_id bigint UNSIGNED;
  DECLARE v_applicant_resume_id bigint UNSIGNED;
  DECLARE v_applicant_parse_id bigint UNSIGNED;

  DECLARE v_candidate_id bigint UNSIGNED;
  DECLARE v_resume_id bigint UNSIGNED;
  DECLARE v_parse_id bigint UNSIGNED;
  DECLARE v_match_score_id bigint UNSIGNED;
  DECLARE v_promoted_count int DEFAULT 0;

  DECLARE cur_scored CURSOR FOR
    SELECT
      jap.applicant_pool_id,
      ajms.applicant_match_score_id,
      ajms.job_post_id,
      ajms.applicant_resume_id,
      ajms.applicant_parse_id
    FROM job_applicant_pool jap
    JOIN applicant_job_match_scores ajms
      ON ajms.applicant_pool_id = jap.applicant_pool_id
     AND ajms.job_post_id = jap.job_post_id
    LEFT JOIN candidates existing_candidate
      ON existing_candidate.source_applicant_pool_id = jap.applicant_pool_id
    WHERE jap.removed = 0
      AND jap.score_status = 'scored'
      AND jap.promoted_candidate_id IS NULL
      AND ajms.promoted_candidate_id IS NULL
      AND existing_candidate.candidate_id IS NULL
      AND ajms.overall_score IS NOT NULL
      AND ajms.decision_status NOT IN ('revoked', 'removed')
    ORDER BY ajms.overall_score DESC, ajms.scored_utc ASC, jap.applicant_pool_id ASC
    LIMIT v_batch_limit;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

  SET v_batch_limit = CASE
    WHEN p_batch_limit IS NULL OR p_batch_limit < 1 THEN 50
    WHEN p_batch_limit > 250 THEN 250
    ELSE p_batch_limit
  END;

  DROP TEMPORARY TABLE IF EXISTS tmp_applicant_promoted_candidates;
  CREATE TEMPORARY TABLE tmp_applicant_promoted_candidates (
    applicant_pool_id bigint UNSIGNED NOT NULL PRIMARY KEY,
    applicant_match_score_id bigint UNSIGNED NOT NULL,
    candidate_id bigint UNSIGNED NOT NULL,
    candidate_match_score_id bigint UNSIGNED NULL,
    promoted_utc datetime NOT NULL
  ) ENGINE = MEMORY;

  OPEN cur_scored;

  promote_loop: LOOP
    FETCH cur_scored
      INTO v_applicant_pool_id,
           v_applicant_match_score_id,
           v_job_post_id,
           v_applicant_resume_id,
           v_applicant_parse_id;

    IF v_done = 1 THEN
      LEAVE promote_loop;
    END IF;

    SET v_candidate_id = NULL;
    SET v_resume_id = NULL;
    SET v_parse_id = NULL;
    SET v_match_score_id = NULL;

    SELECT MAX(candidate_id)
      INTO v_candidate_id
    FROM candidates
    WHERE source_applicant_pool_id = v_applicant_pool_id;

    IF v_candidate_id IS NULL THEN
      INSERT INTO candidates
      (
        first_name,
        last_name,
        email,
        phone,
        external_candidate_id,
        source_applicant_pool_id,
        account_fk,
        job_board_fk,
        jboard,
        source_system,
        zipcode,
        message_number,
        to_address,
        from_address,
        subject,
        sent_date,
        saved,
        removed,
        processed,
        entered_date,
        saved_by,
        saved_date,
        removed_reason,
        subject_original,
        emailed,
        emailed_by,
        emailed_date,
        rating,
        subject_line_id,
        orig_from_address,
        removed_by,
        removed_date_utc,
        resume_points,
        account_email_fk,
        orig_phone,
        processed_by_ai,
        ai_extract_attempt_count,
        utm_source,
        email_verified,
        time_zone_fk,
        timezone_name,
        status,
        created_utc,
        updated_utc
      )
      SELECT
        jap.first_name,
        jap.last_name,
        COALESCE(jap.email, jap.orig_email),
        COALESCE(jap.phone, jap.orig_phone),
        jap.external_id,
        jap.applicant_pool_id,
        jap.account_id,
        jap.job_board_id,
        LEFT(COALESCE(jap.job_board_original, jap.source_name), 50),
        COALESCE(jap.external_source_system, jap.source_name),
        COALESCE(jarp.zipcode, jap.zipcode),
        jap.message_number,
        jap.to_address,
        jap.from_address,
        jap.subject,
        jap.sent_date,
        COALESCE(jap.saved, 0),
        0,
        COALESCE(jap.processed, 1),
        COALESCE(jap.received_utc, UTC_TIMESTAMP()),
        CAST(jap.saved_by AS CHAR),
        jap.saved_utc,
        NULL,
        jap.subject_original,
        0,
        NULL,
        NULL,
        ajms.rating_label,
        NULL,
        jap.orig_from_address,
        NULL,
        NULL,
        CAST(ajms.overall_score AS CHAR),
        jap.to_address,
        jap.orig_phone,
        COALESCE(jap.processed_by_ai, 1),
        COALESCE(jap.ai_extract_attempt_count, 0),
        jap.utm_source,
        0,
        1,
        NULL,
        'candidate',
        UTC_TIMESTAMP(),
        UTC_TIMESTAMP()
      FROM job_applicant_pool jap
      JOIN applicant_job_match_scores ajms
        ON ajms.applicant_match_score_id = v_applicant_match_score_id
      LEFT JOIN job_applicant_resume_parses jarp
        ON jarp.applicant_parse_id = v_applicant_parse_id
      WHERE jap.applicant_pool_id = v_applicant_pool_id;

      SET v_candidate_id = LAST_INSERT_ID();
    END IF;

    IF v_applicant_resume_id IS NOT NULL THEN
      SELECT MAX(resume_id)
        INTO v_resume_id
      FROM candidate_resumes
      WHERE candidate_id = v_candidate_id
        AND source_type = 'applicant_pool';

      IF v_resume_id IS NULL THEN
        INSERT INTO candidate_resumes
        (
          candidate_id,
          source_type,
          original_file_name,
          file_path,
          file_mime_type,
          file_size_bytes,
          raw_text,
          text_hash,
          is_active,
          created_utc,
          updated_utc
        )
        SELECT
          v_candidate_id,
          'applicant_pool',
          jar.original_filename,
          jar.file_path,
          jar.mime_type,
          jar.size_bytes,
          jar.raw_text,
          SHA2(COALESCE(jar.raw_text, jar.file_path, jar.original_filename, ''), 256),
          jar.is_active,
          UTC_TIMESTAMP(),
          UTC_TIMESTAMP()
        FROM job_applicant_resumes jar
        WHERE jar.applicant_resume_id = v_applicant_resume_id;

        SET v_resume_id = LAST_INSERT_ID();
      END IF;
    END IF;

    IF v_resume_id IS NOT NULL AND v_applicant_parse_id IS NOT NULL THEN
      SELECT MAX(parse_id)
        INTO v_parse_id
      FROM candidate_resume_parses
      WHERE candidate_id = v_candidate_id
        AND resume_id = v_resume_id;

      IF v_parse_id IS NULL THEN
        INSERT INTO candidate_resume_parses
        (
          resume_id,
          candidate_id,
          parser_version,
          skill_model_loaded,
          model_path,
          parsed_json,
          full_name,
          first_name,
          last_name,
          email,
          phone,
          location,
          city,
          state,
          zipcode,
          country,
          location_parts_json,
          summary_text,
          skill_years_json,
          work_history_analysis_json,
          education_analysis_json,
          total_experience_months,
          total_experience_years,
          average_tenure_months,
          short_tenure_count,
          gap_count,
          large_gap_count,
          longest_gap_months,
          stability_score,
          highest_degree_level,
          highest_degree_rank,
          highest_degree_label,
          work_experience_json,
          education_json,
          certifications_json,
          parse_status,
          error_message,
          created_utc
        )
        SELECT
          v_resume_id,
          v_candidate_id,
          jarp.parser_version,
          jarp.skill_model_loaded,
          jarp.model_path,
          jarp.parsed_json,
          jarp.full_name,
          jarp.first_name,
          jarp.last_name,
          jarp.email,
          jarp.phone,
          jarp.location,
          jarp.city,
          jarp.state,
          jarp.zipcode,
          jarp.country,
          jarp.location_parts_json,
          jarp.summary_text,
          jarp.skill_years_json,
          jarp.work_history_analysis_json,
          jarp.education_analysis_json,
          jarp.total_experience_months,
          jarp.total_experience_years,
          jarp.average_tenure_months,
          jarp.short_tenure_count,
          jarp.gap_count,
          jarp.large_gap_count,
          jarp.longest_gap_months,
          jarp.stability_score,
          jarp.highest_degree_level,
          jarp.highest_degree_rank,
          LEFT(jarp.highest_degree_label, 255),
          jarp.work_experience_json,
          jarp.education_json,
          jarp.certifications_json,
          jarp.parse_status,
          jarp.parse_error_message,
          UTC_TIMESTAMP()
        FROM job_applicant_resume_parses jarp
        WHERE jarp.applicant_parse_id = v_applicant_parse_id;

        SET v_parse_id = LAST_INSERT_ID();
      END IF;

      INSERT IGNORE INTO candidate_resume_skills
      (
        parse_id,
        resume_id,
        candidate_id,
        skill_name,
        skill_source,
        confidence_score,
        created_utc
      )
      SELECT
        v_parse_id,
        v_resume_id,
        v_candidate_id,
        LEFT(jars.skill_name, 150),
        jars.skill_source,
        jars.confidence_score,
        UTC_TIMESTAMP()
      FROM job_applicant_resume_skills jars
      WHERE jars.applicant_parse_id = v_applicant_parse_id;
    END IF;

    INSERT INTO candidate_job_match_scores
    (
      candidate_id,
      job_post_id,
      resume_id,
      parse_id,
      job_match_extraction_id,
      office_id,
      account_id,
      scoring_profile_id,
      scoring_version,
      model_version,
      has_resume,
      resume_priority_boost,
      overall_score,
      skill_score,
      experience_score,
      responsibility_score,
      education_score,
      location_score,
      application_completeness_score,
      core_score,
      adjustment_score,
      positive_adjustment_points,
      negative_penalty_points,
      capped_penalty_points,
      education_fit_score,
      role_level_fit_score,
      work_history_stability_score,
      compensation_fit_score,
      availability_fit_score,
      rating_label,
      ai_recommendation,
      initial_evaluation_label,
      initial_evaluation_summary,
      initial_evaluation_json,
      tree_terminal_node_key,
      tree_terminal_node_label,
      decision_status,
      recruiter_review_status,
      recruiter_decision,
      recruiter_decision_reason,
      reviewed_by_user_id,
      reviewed_utc,
      revoked_by_user_id,
      revoked_utc,
      revoke_reason,
      score_explanation,
      score_breakdown_json,
      tree_path_json,
      scoring_config_snapshot,
      review_flags_json,
      point_total_json,
      tolerance_summary_json,
      scored_utc,
      created_utc,
      updated_utc
    )
    SELECT
      v_candidate_id,
      ajms.job_post_id,
      v_resume_id,
      v_parse_id,
      ajms.job_match_extraction_id,
      ajms.office_id,
      ajms.account_id,
      ajms.scoring_profile_id,
      ajms.scoring_version,
      ajms.model_version,
      ajms.has_resume,
      ajms.resume_priority_boost,
      ajms.overall_score,
      ajms.skill_score,
      ajms.experience_score,
      ajms.responsibility_score,
      ajms.education_score,
      ajms.location_score,
      ajms.application_completeness_score,
      ajms.core_score,
      ajms.adjustment_score,
      ajms.positive_adjustment_points,
      ajms.negative_penalty_points,
      ajms.capped_penalty_points,
      ajms.education_fit_score,
      ajms.role_level_fit_score,
      ajms.work_history_stability_score,
      ajms.compensation_fit_score,
      ajms.availability_fit_score,
      ajms.rating_label,
      ajms.recommendation,
      ajms.initial_evaluation_label,
      ajms.initial_evaluation_summary,
      ajms.initial_evaluation_json,
      ajms.tree_terminal_node_key,
      ajms.tree_terminal_node_label,
      'scored_pending_review',
      ajms.recruiter_review_status,
      ajms.recruiter_decision,
      ajms.recruiter_decision_reason,
      ajms.reviewed_by_user_id,
      ajms.reviewed_utc,
      ajms.revoked_by_user_id,
      ajms.revoked_utc,
      ajms.revoke_reason,
      ajms.score_explanation,
      ajms.score_breakdown_json,
      ajms.tree_path_json,
      ajms.scoring_config_snapshot,
      ajms.review_flags_json,
      ajms.point_total_json,
      ajms.tolerance_summary_json,
      ajms.scored_utc,
      UTC_TIMESTAMP(),
      UTC_TIMESTAMP()
    FROM applicant_job_match_scores ajms
    WHERE ajms.applicant_match_score_id = v_applicant_match_score_id
    ON DUPLICATE KEY UPDATE
      match_score_id = LAST_INSERT_ID(match_score_id),
      resume_id = VALUES(resume_id),
      parse_id = VALUES(parse_id),
      job_match_extraction_id = VALUES(job_match_extraction_id),
      office_id = VALUES(office_id),
      account_id = VALUES(account_id),
      scoring_profile_id = VALUES(scoring_profile_id),
      model_version = VALUES(model_version),
      has_resume = VALUES(has_resume),
      resume_priority_boost = VALUES(resume_priority_boost),
      overall_score = VALUES(overall_score),
      skill_score = VALUES(skill_score),
      experience_score = VALUES(experience_score),
      responsibility_score = VALUES(responsibility_score),
      education_score = VALUES(education_score),
      location_score = VALUES(location_score),
      application_completeness_score = VALUES(application_completeness_score),
      core_score = VALUES(core_score),
      adjustment_score = VALUES(adjustment_score),
      positive_adjustment_points = VALUES(positive_adjustment_points),
      negative_penalty_points = VALUES(negative_penalty_points),
      capped_penalty_points = VALUES(capped_penalty_points),
      education_fit_score = VALUES(education_fit_score),
      role_level_fit_score = VALUES(role_level_fit_score),
      work_history_stability_score = VALUES(work_history_stability_score),
      compensation_fit_score = VALUES(compensation_fit_score),
      availability_fit_score = VALUES(availability_fit_score),
      rating_label = VALUES(rating_label),
      ai_recommendation = VALUES(ai_recommendation),
      initial_evaluation_label = VALUES(initial_evaluation_label),
      initial_evaluation_summary = VALUES(initial_evaluation_summary),
      initial_evaluation_json = VALUES(initial_evaluation_json),
      tree_terminal_node_key = VALUES(tree_terminal_node_key),
      tree_terminal_node_label = VALUES(tree_terminal_node_label),
      score_explanation = VALUES(score_explanation),
      score_breakdown_json = VALUES(score_breakdown_json),
      tree_path_json = VALUES(tree_path_json),
      scoring_config_snapshot = VALUES(scoring_config_snapshot),
      review_flags_json = VALUES(review_flags_json),
      point_total_json = VALUES(point_total_json),
      tolerance_summary_json = VALUES(tolerance_summary_json),
      scored_utc = VALUES(scored_utc),
      updated_utc = UTC_TIMESTAMP();

    SET v_match_score_id = LAST_INSERT_ID();

    INSERT INTO candidate_job_match_requirement_evaluations
    (
      match_score_id,
      criteria_key,
      subcriteria_key,
      requirement_type,
      requirement_key,
      requirement_label,
      requirement_text,
      job_required_value,
      job_required_unit,
      candidate_value,
      candidate_unit,
      match_result,
      match_strength,
      points_possible,
      points_earned,
      penalty_possible,
      penalty_applied,
      tolerance_value,
      tolerance_unit,
      within_tolerance,
      is_disqualifier,
      triggered_disqualifier,
      review_flag,
      candidate_evidence_text,
      evidence_json,
      calculation_json,
      notes,
      sort_order,
      created_utc
    )
    SELECT
      v_match_score_id,
      areq.criteria_key,
      areq.subcriteria_key,
      areq.requirement_type,
      areq.requirement_key,
      areq.requirement_label,
      areq.requirement_text,
      areq.job_required_value,
      areq.job_required_unit,
      areq.candidate_value,
      areq.candidate_unit,
      areq.match_result,
      areq.match_strength,
      areq.points_possible,
      areq.points_earned,
      areq.penalty_possible,
      areq.penalty_applied,
      areq.tolerance_value,
      areq.tolerance_unit,
      areq.within_tolerance,
      areq.is_disqualifier,
      areq.triggered_disqualifier,
      areq.review_flag,
      areq.candidate_evidence_text,
      areq.evidence_json,
      areq.calculation_json,
      areq.notes,
      areq.sort_order,
      UTC_TIMESTAMP()
    FROM applicant_job_match_requirement_evaluations areq
    WHERE areq.applicant_match_score_id = v_applicant_match_score_id
    ON DUPLICATE KEY UPDATE
      subcriteria_key = VALUES(subcriteria_key),
      requirement_label = VALUES(requirement_label),
      requirement_text = VALUES(requirement_text),
      job_required_value = VALUES(job_required_value),
      job_required_unit = VALUES(job_required_unit),
      candidate_value = VALUES(candidate_value),
      candidate_unit = VALUES(candidate_unit),
      match_result = VALUES(match_result),
      match_strength = VALUES(match_strength),
      points_possible = VALUES(points_possible),
      points_earned = VALUES(points_earned),
      penalty_possible = VALUES(penalty_possible),
      penalty_applied = VALUES(penalty_applied),
      tolerance_value = VALUES(tolerance_value),
      tolerance_unit = VALUES(tolerance_unit),
      within_tolerance = VALUES(within_tolerance),
      is_disqualifier = VALUES(is_disqualifier),
      triggered_disqualifier = VALUES(triggered_disqualifier),
      review_flag = VALUES(review_flag),
      candidate_evidence_text = VALUES(candidate_evidence_text),
      evidence_json = VALUES(evidence_json),
      calculation_json = VALUES(calculation_json),
      notes = VALUES(notes),
      sort_order = VALUES(sort_order);

    INSERT INTO candidate_job_match_adjustments
    (
      match_score_id,
      adjustment_key,
      adjustment_label,
      adjustment_category,
      adjustment_direction,
      raw_adjustment_points,
      applied_adjustment_points,
      max_positive_points,
      max_negative_penalty,
      score_before_adjustment,
      score_after_adjustment,
      review_flag,
      is_disqualifier,
      triggered_disqualifier,
      reason_text,
      evidence_json,
      calculation_json,
      sort_order,
      created_utc
    )
    SELECT
      v_match_score_id,
      aadj.adjustment_key,
      aadj.adjustment_label,
      aadj.adjustment_category,
      aadj.adjustment_direction,
      aadj.raw_adjustment_points,
      aadj.applied_adjustment_points,
      aadj.max_positive_points,
      aadj.max_negative_penalty,
      aadj.score_before_adjustment,
      aadj.score_after_adjustment,
      aadj.review_flag,
      aadj.is_disqualifier,
      aadj.triggered_disqualifier,
      aadj.reason_text,
      aadj.evidence_json,
      aadj.calculation_json,
      aadj.sort_order,
      UTC_TIMESTAMP()
    FROM applicant_job_match_adjustments aadj
    WHERE aadj.applicant_match_score_id = v_applicant_match_score_id
    ON DUPLICATE KEY UPDATE
      adjustment_label = VALUES(adjustment_label),
      adjustment_category = VALUES(adjustment_category),
      adjustment_direction = VALUES(adjustment_direction),
      raw_adjustment_points = VALUES(raw_adjustment_points),
      applied_adjustment_points = VALUES(applied_adjustment_points),
      max_positive_points = VALUES(max_positive_points),
      max_negative_penalty = VALUES(max_negative_penalty),
      score_before_adjustment = VALUES(score_before_adjustment),
      score_after_adjustment = VALUES(score_after_adjustment),
      review_flag = VALUES(review_flag),
      is_disqualifier = VALUES(is_disqualifier),
      triggered_disqualifier = VALUES(triggered_disqualifier),
      reason_text = VALUES(reason_text),
      evidence_json = VALUES(evidence_json),
      calculation_json = VALUES(calculation_json),
      sort_order = VALUES(sort_order);

    INSERT INTO candidate_job_match_review_flags
    (
      match_score_id,
      flag_key,
      flag_label,
      flag_severity,
      flag_category,
      is_resolved,
      resolved_by_user_id,
      resolved_utc,
      resolution_note,
      flag_text,
      evidence_json,
      created_utc,
      updated_utc
    )
    SELECT
      v_match_score_id,
      arf.flag_key,
      arf.flag_label,
      arf.flag_severity,
      arf.flag_category,
      arf.is_resolved,
      arf.resolved_by_user_id,
      arf.resolved_utc,
      arf.resolution_note,
      arf.flag_text,
      arf.evidence_json,
      UTC_TIMESTAMP(),
      UTC_TIMESTAMP()
    FROM applicant_job_match_review_flags arf
    WHERE arf.applicant_match_score_id = v_applicant_match_score_id
    ON DUPLICATE KEY UPDATE
      flag_label = VALUES(flag_label),
      flag_severity = VALUES(flag_severity),
      flag_category = VALUES(flag_category),
      is_resolved = VALUES(is_resolved),
      resolved_by_user_id = VALUES(resolved_by_user_id),
      resolved_utc = VALUES(resolved_utc),
      resolution_note = VALUES(resolution_note),
      flag_text = VALUES(flag_text),
      evidence_json = VALUES(evidence_json),
      updated_utc = UTC_TIMESTAMP();

    UPDATE applicant_job_match_scores
    SET
      promoted_candidate_id = v_candidate_id,
      promoted_utc = UTC_TIMESTAMP(),
      decision_status = 'promoted_to_candidate',
      updated_utc = UTC_TIMESTAMP()
    WHERE applicant_match_score_id = v_applicant_match_score_id;

    UPDATE job_applicant_pool
    SET
      promoted_candidate_id = v_candidate_id,
      applicant_status = 'promoted',
      processed = 1,
      processed_by_ai = 1,
      processed_utc = COALESCE(processed_utc, UTC_TIMESTAMP()),
      updated_utc = UTC_TIMESTAMP()
    WHERE applicant_pool_id = v_applicant_pool_id;

    INSERT INTO tmp_applicant_promoted_candidates
    (
      applicant_pool_id,
      applicant_match_score_id,
      candidate_id,
      candidate_match_score_id,
      promoted_utc
    )
    VALUES
    (
      v_applicant_pool_id,
      v_applicant_match_score_id,
      v_candidate_id,
      v_match_score_id,
      UTC_TIMESTAMP()
    );

    SET v_promoted_count = v_promoted_count + 1;
  END LOOP;

  CLOSE cur_scored;

  SELECT v_promoted_count AS promoted_count;

  SELECT
    applicant_pool_id,
    applicant_match_score_id,
    candidate_id,
    candidate_match_score_id,
    promoted_utc
  FROM tmp_applicant_promoted_candidates
  ORDER BY promoted_utc ASC, applicant_pool_id ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_applicant_processing_queue_summary
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_applicant_processing_queue_summary`;
delimiter ;;
CREATE PROCEDURE `sp_applicant_processing_queue_summary`()
BEGIN
  SELECT
    queue_status,
    queue_type,
    COUNT(*) AS total_rows,
    MIN(created_utc) AS oldest_created_utc,
    MAX(updated_utc) AS newest_updated_utc
  FROM applicant_processing_queue
  GROUP BY queue_status, queue_type
  ORDER BY queue_status, queue_type;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_ai_parse_batch_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_ai_parse_batch_create`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_ai_parse_batch_create`(IN p_candidate_ids_json JSON,
  IN p_auto_accept TINYINT,
  IN p_requested_by_user_id BIGINT)
BEGIN
  DECLARE v_batch_id BIGINT UNSIGNED DEFAULT 0;

  INSERT INTO candidate_ai_parse_batches
    (requested_by_user_id, auto_accept, batch_status, created_utc, updated_utc)
  VALUES
    (p_requested_by_user_id, IFNULL(p_auto_accept, 0), 'queued', UTC_TIMESTAMP(), UTC_TIMESTAMP());

  SET v_batch_id = LAST_INSERT_ID();

  INSERT IGNORE INTO candidate_ai_parse_batch_items
    (batch_id, candidate_id, resume_id, account_id, item_status, message, created_utc, updated_utc)
  SELECT
    v_batch_id,
    c.candidate_id,
    cr.resume_id,
    c.account_fk,
    CASE WHEN cr.resume_id IS NULL THEN 'failed' ELSE 'queued' END,
    CASE WHEN cr.resume_id IS NULL THEN 'No active resume found.' ELSE 'Waiting...' END,
    UTC_TIMESTAMP(),
    UTC_TIMESTAMP()
  FROM JSON_TABLE(p_candidate_ids_json, '$[*]' COLUMNS(candidate_id BIGINT PATH '$')) jt
  INNER JOIN candidates c
    ON c.candidate_id = jt.candidate_id
  LEFT JOIN candidate_resumes cr
    ON cr.resume_id = (
      SELECT cr2.resume_id
      FROM candidate_resumes cr2
      WHERE cr2.candidate_id = c.candidate_id
        AND cr2.is_active = 1
      ORDER BY cr2.updated_utc DESC, cr2.resume_id DESC
      LIMIT 1
    )
  GROUP BY c.candidate_id, cr.resume_id, c.account_fk;

  CALL sp_candidate_ai_parse_batch_recount(v_batch_id);

  SELECT v_batch_id AS batch_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_ai_parse_batch_recount
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_ai_parse_batch_recount`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_ai_parse_batch_recount`(IN p_batch_id BIGINT UNSIGNED)
BEGIN
  UPDATE candidate_ai_parse_batches b
  SET
    total_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id),
    queued_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status = 'queued'),
    parsing_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status = 'parsing'),
    parsed_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status = 'parsed'),
    updated_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status = 'updated'),
    needs_review_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status = 'needs_review'),
    failed_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status = 'failed'),
    cancelled_count = (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status = 'cancelled'),
    batch_status = CASE
      WHEN (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id) = 0 THEN 'empty'
      WHEN (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status IN ('queued','parsing')) > 0 THEN 'processing'
      ELSE 'completed'
    END,
    started_utc = CASE
      WHEN started_utc IS NULL AND (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status IN ('parsing','parsed','updated','needs_review','failed','cancelled')) > 0 THEN UTC_TIMESTAMP()
      ELSE started_utc
    END,
    completed_utc = CASE
      WHEN (SELECT COUNT(*) FROM candidate_ai_parse_batch_items i WHERE i.batch_id = p_batch_id AND i.item_status IN ('queued','parsing')) = 0 THEN UTC_TIMESTAMP()
      ELSE completed_utc
    END,
    updated_utc = UTC_TIMESTAMP()
  WHERE b.batch_id = p_batch_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_ai_parse_claim_next
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_ai_parse_claim_next`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_ai_parse_claim_next`(IN p_worker_id VARCHAR(100),
  IN p_stale_minutes INT)
BEGIN
  DECLARE v_item_id BIGINT UNSIGNED DEFAULT NULL;
  DECLARE v_token CHAR(36) DEFAULT UUID();

  SELECT i.batch_item_id INTO v_item_id
  FROM candidate_ai_parse_batch_items i
  INNER JOIN candidate_ai_parse_batches b ON b.batch_id = i.batch_id
  WHERE i.item_status = 'queued'
     OR (i.item_status = 'parsing' AND i.locked_utc < DATE_SUB(UTC_TIMESTAMP(), INTERVAL IFNULL(p_stale_minutes, 30) MINUTE) AND i.attempt_count < i.max_attempts)
  ORDER BY b.created_utc ASC, i.batch_item_id ASC
  LIMIT 1
  FOR UPDATE;

  IF v_item_id IS NULL THEN
    SELECT NULL AS batch_item_id;
  ELSE
    UPDATE candidate_ai_parse_batch_items
    SET
      item_status = 'parsing',
      message = 'Parsing resume...',
      attempt_count = attempt_count + 1,
      locked_by = p_worker_id,
      lock_token = v_token,
      locked_utc = UTC_TIMESTAMP(),
      started_utc = COALESCE(started_utc, UTC_TIMESTAMP()),
      updated_utc = UTC_TIMESTAMP()
    WHERE batch_item_id = v_item_id;

    UPDATE candidate_ai_parse_batches b
    INNER JOIN candidate_ai_parse_batch_items i ON i.batch_id = b.batch_id
    SET b.batch_status = 'processing', b.started_utc = COALESCE(b.started_utc, UTC_TIMESTAMP()), b.updated_utc = UTC_TIMESTAMP()
    WHERE i.batch_item_id = v_item_id;

    SELECT
      i.batch_item_id,
      i.batch_id,
      i.candidate_id,
      i.resume_id,
      i.lock_token,
      b.auto_accept,
      c.account_fk,
      c.source_applicant_pool_id,
      c.first_name,
      c.last_name,
      c.email,
      c.phone,
      cr.file_path,
      cr.raw_text,
      cr.original_file_name
    FROM candidate_ai_parse_batch_items i
    INNER JOIN candidate_ai_parse_batches b ON b.batch_id = i.batch_id
    INNER JOIN candidates c ON c.candidate_id = i.candidate_id
    LEFT JOIN candidate_resumes cr ON cr.resume_id = i.resume_id
    WHERE i.batch_item_id = v_item_id
    LIMIT 1;
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_ai_parse_mark_result
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_ai_parse_mark_result`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_ai_parse_mark_result`(IN p_batch_item_id BIGINT UNSIGNED,
  IN p_lock_token CHAR(36),
  IN p_item_status VARCHAR(50),
  IN p_message VARCHAR(255),
  IN p_current_json JSON,
  IN p_parsed_json JSON,
  IN p_diff_json JSON,
  IN p_applied_fields_json JSON,
  IN p_error_message TEXT)
BEGIN
  DECLARE v_batch_id BIGINT UNSIGNED DEFAULT NULL;

  SELECT batch_id INTO v_batch_id
  FROM candidate_ai_parse_batch_items
  WHERE batch_item_id = p_batch_item_id
    AND lock_token = p_lock_token
  LIMIT 1;

  IF v_batch_id IS NOT NULL THEN
    UPDATE candidate_ai_parse_batch_items
    SET
      item_status = p_item_status,
      message = p_message,
      current_json = p_current_json,
      parsed_json = p_parsed_json,
      diff_json = p_diff_json,
      applied_fields_json = p_applied_fields_json,
      error_message = p_error_message,
      completed_utc = UTC_TIMESTAMP(),
      locked_by = NULL,
      lock_token = NULL,
      locked_utc = NULL,
      updated_utc = UTC_TIMESTAMP()
    WHERE batch_item_id = p_batch_item_id
      AND lock_token = p_lock_token;

    CALL sp_candidate_ai_parse_batch_recount(v_batch_id);
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_apply_ai_parse_contact_updates
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_apply_ai_parse_contact_updates`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_apply_ai_parse_contact_updates`(IN p_updates_json JSON,
    IN p_updated_by_user_id BIGINT UNSIGNED)
BEGIN
    DECLARE v_total INT DEFAULT 0;

    DROP TEMPORARY TABLE IF EXISTS tmp_candidate_ai_parse_updates;
    CREATE TEMPORARY TABLE tmp_candidate_ai_parse_updates (
        candidate_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
        first_name VARCHAR(100) NULL,
        last_name VARCHAR(100) NULL,
        email VARCHAR(255) NULL,
        phone VARCHAR(50) NULL
    ) ENGINE=Memory;

    INSERT INTO tmp_candidate_ai_parse_updates (
        candidate_id,
        first_name,
        last_name,
        email,
        phone
    )
    SELECT
        jt.candidate_id,
        NULLIF(TRIM(jt.first_name), ''),
        NULLIF(TRIM(jt.last_name), ''),
        NULLIF(TRIM(jt.email), ''),
        NULLIF(TRIM(jt.phone), '')
    FROM JSON_TABLE(
        p_updates_json,
        '$[*]' COLUMNS (
            candidate_id BIGINT UNSIGNED PATH '$.candidate_id',
            first_name VARCHAR(100) PATH '$.first_name' NULL ON EMPTY,
            last_name VARCHAR(100) PATH '$.last_name' NULL ON EMPTY,
            email VARCHAR(255) PATH '$.email' NULL ON EMPTY,
            phone VARCHAR(50) PATH '$.phone' NULL ON EMPTY
        )
    ) AS jt
    WHERE jt.candidate_id IS NOT NULL;

    SELECT COUNT(*) INTO v_total FROM tmp_candidate_ai_parse_updates;

    UPDATE candidates c
    INNER JOIN tmp_candidate_ai_parse_updates u
        ON u.candidate_id = c.candidate_id
    SET
        c.first_name = u.first_name,
        c.last_name = u.last_name,
        c.email = u.email,
        c.phone = u.phone,
        c.updated_utc = UTC_TIMESTAMP();

    UPDATE job_applicant_pool jap
    INNER JOIN candidates c
        ON c.source_applicant_pool_id = jap.applicant_pool_id
    INNER JOIN tmp_candidate_ai_parse_updates u
        ON u.candidate_id = c.candidate_id
    SET
        jap.first_name = u.first_name,
        jap.last_name = u.last_name,
        jap.full_name = TRIM(CONCAT_WS(' ', u.first_name, u.last_name)),
        jap.email = u.email,
        jap.phone = u.phone,
        jap.updated_utc = UTC_TIMESTAMP();

    UPDATE job_applicant_pool jap
    INNER JOIN tmp_candidate_ai_parse_updates u
        ON u.candidate_id = jap.promoted_candidate_id
    SET
        jap.first_name = u.first_name,
        jap.last_name = u.last_name,
        jap.full_name = TRIM(CONCAT_WS(' ', u.first_name, u.last_name)),
        jap.email = u.email,
        jap.phone = u.phone,
        jap.updated_utc = UTC_TIMESTAMP();

    UPDATE candidate_resume_parses crp
    INNER JOIN tmp_candidate_ai_parse_updates u
        ON u.candidate_id = crp.candidate_id
    SET
        crp.first_name = u.first_name,
        crp.last_name = u.last_name,
        crp.full_name = TRIM(CONCAT_WS(' ', u.first_name, u.last_name)),
        crp.email = u.email,
        crp.phone = u.phone;

    UPDATE job_applicant_resume_parses jarp
    INNER JOIN candidates c
        ON c.source_applicant_pool_id = jarp.applicant_pool_id
    INNER JOIN tmp_candidate_ai_parse_updates u
        ON u.candidate_id = c.candidate_id
    SET
        jarp.first_name = u.first_name,
        jarp.last_name = u.last_name,
        jarp.full_name = TRIM(CONCAT_WS(' ', u.first_name, u.last_name)),
        jarp.email = u.email,
        jarp.phone = u.phone,
        jarp.updated_utc = UTC_TIMESTAMP();

    SELECT v_total AS applied_count;

    DROP TEMPORARY TABLE IF EXISTS tmp_candidate_ai_parse_updates;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_cancel
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_cancel`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_cancel`(IN p_processing_queue_id bigint UNSIGNED,
  IN p_reason text)
BEGIN
  UPDATE candidate_processing_queue
  SET
    queue_status = 'cancelled',
    locked_by = NULL,
    lock_token = NULL,
    locked_utc = NULL,
    last_error_message = LEFT(COALESCE(p_reason, 'Cancelled'), 65535),
    updated_utc = UTC_TIMESTAMP()
  WHERE processing_queue_id = p_processing_queue_id
    AND queue_status IN ('pending', 'retry', 'failed');
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_claim_jobs
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_claim_jobs`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_claim_jobs`(IN p_worker_id varchar(100),
  IN p_batch_limit int,
  IN p_stale_minutes int)
BEGIN
  DECLARE v_batch_limit int DEFAULT 10;
  DECLARE v_stale_minutes int DEFAULT 30;
  DECLARE v_lock_token char(36);

  SET v_batch_limit = CASE
    WHEN p_batch_limit IS NULL OR p_batch_limit < 1 THEN 10
    WHEN p_batch_limit > 100 THEN 100
    ELSE p_batch_limit
  END;

  SET v_stale_minutes = CASE
    WHEN p_stale_minutes IS NULL OR p_stale_minutes < 5 THEN 30
    ELSE p_stale_minutes
  END;

  SET v_lock_token = UUID();

  START TRANSACTION;

  -- Recycle stale processing rows.
  UPDATE candidate_processing_queue
  SET
    queue_status = CASE
      WHEN attempt_count >= max_attempts THEN 'failed'
      ELSE 'retry'
    END,
    locked_by = NULL,
    lock_token = NULL,
    locked_utc = NULL,
    failed_utc = CASE
      WHEN attempt_count >= max_attempts THEN UTC_TIMESTAMP()
      ELSE failed_utc
    END,
    last_error_message = CASE
      WHEN attempt_count >= max_attempts THEN COALESCE(last_error_message, 'Processing lock expired.')
      ELSE last_error_message
    END,
    updated_utc = UTC_TIMESTAMP()
  WHERE queue_status = 'processing'
    AND locked_utc IS NOT NULL
    AND locked_utc < DATE_SUB(UTC_TIMESTAMP(), INTERVAL v_stale_minutes MINUTE);

  -- Claim a batch.
  UPDATE candidate_processing_queue
  SET
    queue_status = 'processing',
    locked_by = p_worker_id,
    lock_token = v_lock_token,
    locked_utc = UTC_TIMESTAMP(),
    started_utc = UTC_TIMESTAMP(),
    completed_utc = NULL,
    failed_utc = NULL,
    attempt_count = attempt_count + 1,
    updated_utc = UTC_TIMESTAMP()
  WHERE queue_status IN ('pending', 'retry')
    AND attempt_count < max_attempts
  ORDER BY priority ASC, created_utc ASC
  LIMIT v_batch_limit;

  COMMIT;

  -- Return only rows claimed by this call.
  SELECT
    processing_queue_id,
    candidate_id,
    job_post_id,
    office_id,
    account_id,
    queue_type,
    queue_status,
    priority,
    attempt_count,
    max_attempts,
    locked_by,
    lock_token,
    locked_utc,
    payload_json
  FROM candidate_processing_queue
  WHERE lock_token = v_lock_token
  ORDER BY priority ASC, created_utc ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_enqueue
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_enqueue`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_enqueue`(IN p_candidate_id bigint UNSIGNED,
  IN p_job_post_id bigint UNSIGNED,
  IN p_office_id int,
  IN p_account_id int,
  IN p_has_resume tinyint,
  IN p_queue_type varchar(50),
  IN p_payload_json json)
BEGIN
  DECLARE v_queue_type varchar(50);
  DECLARE v_priority int;

  SET v_queue_type = COALESCE(NULLIF(p_queue_type, ''), 'resume_score');

  -- Lower number = higher priority.
  -- Candidates with resumes are processed first.
  SET v_priority = CASE
    WHEN COALESCE(p_has_resume, 0) = 1 THEN 10
    ELSE 100
  END;

  INSERT INTO candidate_processing_queue
  (
    candidate_id,
    job_post_id,
    office_id,
    account_id,
    queue_type,
    queue_status,
    priority,
    attempt_count,
    max_attempts,
    locked_by,
    lock_token,
    locked_utc,
    started_utc,
    completed_utc,
    failed_utc,
    last_error_message,
    payload_json
  )
  VALUES
  (
    p_candidate_id,
    p_job_post_id,
    p_office_id,
    p_account_id,
    v_queue_type,
    'pending',
    v_priority,
    0,
    3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    p_payload_json
  )
  ON DUPLICATE KEY UPDATE
    office_id = VALUES(office_id),
    account_id = VALUES(account_id),
    priority = LEAST(priority, VALUES(priority)),
    payload_json = VALUES(payload_json),
    queue_status = CASE
      WHEN queue_status IN ('completed', 'processing') THEN queue_status
      ELSE 'pending'
    END,
    last_error_message = CASE
      WHEN queue_status IN ('completed', 'processing') THEN last_error_message
      ELSE NULL
    END,
    failed_utc = CASE
      WHEN queue_status IN ('completed', 'processing') THEN failed_utc
      ELSE NULL
    END,
    updated_utc = UTC_TIMESTAMP();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_mark_completed
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_mark_completed`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_mark_completed`(IN p_processing_queue_id bigint UNSIGNED,
  IN p_lock_token char(36))
BEGIN
  UPDATE candidate_processing_queue
  SET
    queue_status = 'completed',
    completed_utc = UTC_TIMESTAMP(),
    locked_by = NULL,
    lock_token = NULL,
    locked_utc = NULL,
    last_error_message = NULL,
    updated_utc = UTC_TIMESTAMP()
  WHERE processing_queue_id = p_processing_queue_id
    AND lock_token = p_lock_token
    AND queue_status = 'processing';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_mark_failed
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_mark_failed`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_mark_failed`(IN p_processing_queue_id bigint UNSIGNED,
  IN p_lock_token char(36),
  IN p_error_message text)
BEGIN
  UPDATE candidate_processing_queue
  SET
    queue_status = CASE
      WHEN attempt_count >= max_attempts THEN 'failed'
      ELSE 'retry'
    END,
    failed_utc = CASE
      WHEN attempt_count >= max_attempts THEN UTC_TIMESTAMP()
      ELSE failed_utc
    END,
    locked_by = NULL,
    lock_token = NULL,
    locked_utc = NULL,
    last_error_message = LEFT(COALESCE(p_error_message, 'Unknown processing error'), 65535),
    updated_utc = UTC_TIMESTAMP()
  WHERE processing_queue_id = p_processing_queue_id
    AND lock_token = p_lock_token
    AND queue_status = 'processing';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_queue_summary
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_queue_summary`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_queue_summary`()
BEGIN
  SELECT
    queue_status,
    COUNT(*) AS total,
    MIN(created_utc) AS oldest_created_utc,
    MAX(updated_utc) AS latest_updated_utc
  FROM candidate_processing_queue
  GROUP BY queue_status
  ORDER BY queue_status;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_reprocess
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_reprocess`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_reprocess`(IN p_candidate_id bigint UNSIGNED,
  IN p_job_post_id bigint UNSIGNED,
  IN p_queue_type varchar(50),
  IN p_reason text)
BEGIN
  DECLARE v_queue_type varchar(50);
  SET v_queue_type = COALESCE(NULLIF(p_queue_type, ''), 'resume_score');

  UPDATE candidate_processing_queue
  SET
    queue_status = 'pending',
    attempt_count = 0,
    locked_by = NULL,
    lock_token = NULL,
    locked_utc = NULL,
    started_utc = NULL,
    completed_utc = NULL,
    failed_utc = NULL,
    last_error_message = NULL,
    payload_json = JSON_OBJECT(
      'source', 'manual_reprocess',
      'reason', COALESCE(p_reason, ''),
      'requested_utc', UTC_TIMESTAMP()
    ),
    updated_utc = UTC_TIMESTAMP()
  WHERE candidate_id = p_candidate_id
    AND job_post_id = p_job_post_id
    AND queue_type = v_queue_type;

  SELECT
    processing_queue_id,
    candidate_id,
    job_post_id,
    queue_type,
    queue_status,
    attempt_count,
    payload_json,
    updated_utc
  FROM candidate_processing_queue
  WHERE candidate_id = p_candidate_id
    AND job_post_id = p_job_post_id
    AND queue_type = v_queue_type
  ORDER BY processing_queue_id DESC
  LIMIT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_processing_retry
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_processing_retry`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_processing_retry`(IN p_processing_queue_id bigint UNSIGNED)
BEGIN
  UPDATE candidate_processing_queue
  SET
    queue_status = 'pending',
    locked_by = NULL,
    lock_token = NULL,
    locked_utc = NULL,
    started_utc = NULL,
    completed_utc = NULL,
    failed_utc = NULL,
    last_error_message = NULL,
    updated_utc = UTC_TIMESTAMP()
  WHERE processing_queue_id = p_processing_queue_id
    AND queue_status IN ('failed', 'cancelled', 'retry');
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_promotion_restore_source_contact
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_promotion_restore_source_contact`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_promotion_restore_source_contact`(IN p_limit int)
BEGIN
  DECLARE v_limit int DEFAULT 100;

  SET v_limit = CASE
    WHEN p_limit IS NULL OR p_limit < 1 THEN 100
    WHEN p_limit > 1000 THEN 1000
    ELSE p_limit
  END;

  DROP TEMPORARY TABLE IF EXISTS tmp_candidate_source_contact_repair;
  CREATE TEMPORARY TABLE tmp_candidate_source_contact_repair (
    candidate_id bigint UNSIGNED NOT NULL PRIMARY KEY
  ) ENGINE = MEMORY;

  INSERT INTO tmp_candidate_source_contact_repair (candidate_id)
  SELECT c.candidate_id
  FROM candidates c
  INNER JOIN job_applicant_pool jap
    ON jap.applicant_pool_id = c.source_applicant_pool_id
  WHERE c.source_applicant_pool_id IS NOT NULL
    AND (
      COALESCE(c.first_name, '') <> COALESCE(jap.first_name, '')
      OR COALESCE(c.last_name, '') <> COALESCE(jap.last_name, '')
      OR COALESCE(c.email, '') <> COALESCE(jap.email, jap.orig_email, '')
      OR COALESCE(c.phone, '') <> COALESCE(jap.phone, jap.orig_phone, '')
    )
  ORDER BY c.candidate_id DESC
  LIMIT v_limit;

  UPDATE candidates c
  INNER JOIN tmp_candidate_source_contact_repair tmp
    ON tmp.candidate_id = c.candidate_id
  INNER JOIN job_applicant_pool jap
    ON jap.applicant_pool_id = c.source_applicant_pool_id
  SET
    c.first_name = jap.first_name,
    c.last_name = jap.last_name,
    c.email = COALESCE(jap.email, jap.orig_email),
    c.phone = COALESCE(jap.phone, jap.orig_phone),
    c.updated_utc = UTC_TIMESTAMP();

  SELECT ROW_COUNT() AS repaired_count;

  SELECT
    c.candidate_id,
    c.source_applicant_pool_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone,
    c.updated_utc
  FROM candidates c
  INNER JOIN tmp_candidate_source_contact_repair tmp
    ON tmp.candidate_id = c.candidate_id
  ORDER BY c.candidate_id DESC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_candidate_promotion_source_contact_preview
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_candidate_promotion_source_contact_preview`;
delimiter ;;
CREATE PROCEDURE `sp_candidate_promotion_source_contact_preview`(IN p_limit int)
BEGIN
  DECLARE v_limit int DEFAULT 100;

  SET v_limit = CASE
    WHEN p_limit IS NULL OR p_limit < 1 THEN 100
    WHEN p_limit > 1000 THEN 1000
    ELSE p_limit
  END;

  SELECT
    c.candidate_id,
    c.source_applicant_pool_id,
    CONCAT_WS(' ', c.first_name, c.last_name) AS current_candidate_name,
    CONCAT_WS(' ', jap.first_name, jap.last_name) AS source_applicant_name,
    c.first_name AS current_first_name,
    jap.first_name AS source_first_name,
    c.last_name AS current_last_name,
    jap.last_name AS source_last_name,
    c.email AS current_email,
    COALESCE(jap.email, jap.orig_email) AS source_email,
    c.phone AS current_phone,
    COALESCE(jap.phone, jap.orig_phone) AS source_phone,
    c.updated_utc AS candidate_updated_utc,
    jap.updated_utc AS applicant_updated_utc
  FROM candidates c
  INNER JOIN job_applicant_pool jap
    ON jap.applicant_pool_id = c.source_applicant_pool_id
  WHERE c.source_applicant_pool_id IS NOT NULL
    AND (
      COALESCE(c.first_name, '') <> COALESCE(jap.first_name, '')
      OR COALESCE(c.last_name, '') <> COALESCE(jap.last_name, '')
      OR COALESCE(c.email, '') <> COALESCE(jap.email, jap.orig_email, '')
      OR COALESCE(c.phone, '') <> COALESCE(jap.phone, jap.orig_phone, '')
    )
  ORDER BY c.candidate_id DESC
  LIMIT v_limit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for _jp_delete_table_if_exists
-- ----------------------------
DROP PROCEDURE IF EXISTS `_jp_delete_table_if_exists`;
delimiter ;;
CREATE PROCEDURE `_jp_delete_table_if_exists`(IN p_table_name varchar(128))
BEGIN
  SET @table_exists := (
    SELECT COUNT(*)
    FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = p_table_name
  );

  SET @sql := IF(
    @table_exists > 0,
    CONCAT('DELETE FROM `', REPLACE(p_table_name, '`', '``'), '`'),
    'SELECT 1'
  );

  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table applicant_resumes
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_applicant_resumes_max3_before_insert`;
delimiter ;;
CREATE TRIGGER `trg_applicant_resumes_max3_before_insert` BEFORE INSERT ON `applicant_resumes` FOR EACH ROW BEGIN
  DECLARE resume_count INT DEFAULT 0;

  IF NEW.deleted_utc IS NULL THEN
    SELECT COUNT(*)
      INTO resume_count
    FROM `applicant_resumes`
    WHERE applicant_account_id = NEW.applicant_account_id
      AND deleted_utc IS NULL;

    IF resume_count >= 3 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Applicant account cannot have more than 3 active resumes.';
    END IF;
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table applicant_resumes
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_applicant_resumes_max3_before_update`;
delimiter ;;
CREATE TRIGGER `trg_applicant_resumes_max3_before_update` BEFORE UPDATE ON `applicant_resumes` FOR EACH ROW BEGIN
  DECLARE resume_count INT DEFAULT 0;

  IF OLD.deleted_utc IS NOT NULL
     AND NEW.deleted_utc IS NULL THEN

    SELECT COUNT(*)
      INTO resume_count
    FROM `applicant_resumes`
    WHERE applicant_account_id = NEW.applicant_account_id
      AND deleted_utc IS NULL
      AND applicant_resume_id <> OLD.applicant_resume_id;

    IF resume_count >= 3 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Applicant account cannot have more than 3 active resumes.';
    END IF;
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
