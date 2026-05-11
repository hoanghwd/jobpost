<?php
declare(strict_types=1);

use App\Core\Router;
use App\Modules\Auth\Controllers\AuthController;
use App\Modules\Home\Controllers\HomeController;
use App\Modules\Candidate\Controllers\CandidateController;
use App\Modules\Conversation\Controllers\ConversationController;
use App\Modules\Conversation\Controllers\CandidateChatController;
use App\Modules\Office\Controllers\OfficeSettingController;
use App\Modules\Dashboard\Controllers\DashboardController;
use App\Modules\AI\Controllers\AISettingsController;
use App\Modules\ProcessApplicants\Controllers\ProcessApplicantsController;

require_once dirname(__DIR__) . '/app/Support/Auth.php';

/** @var Router $router */

$router->get('/login', [AuthController::class, 'showLogin']);
$router->post('/login-ajax', [AuthController::class, 'loginAjax']);
$router->post('/logout-ajax', [AuthController::class, 'logoutAjax']);
$router->post('/session/ping', [AuthController::class, 'ping']);

$router->get('/', function () {
    require_once dirname(__DIR__) . '/app/Support/Auth.php';
    \jp_start_secure_session();

    $title = 'jobPortal Home';
    ob_start();
    require dirname(__DIR__) . '/app/Modules/Home/Views/home.php';
    $content = (string) ob_get_clean();
    require dirname(__DIR__) . '/app/Views/layouts/main.php';
});

$router->get('/index', function () { \jp_require_auth(); (new HomeController())->index(); });
$router->get('/health', function () {
    header('Content-Type: application/json; charset=UTF-8');
    echo json_encode(['success' => true,'message' => 'jobPortal is up.','timestamp_utc' => gmdate('Y-m-d H:i:s')], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
});

$router->get('/candidates', function () { \jp_require_auth(); (new CandidateController())->index(); });
$router->get('/candidates/list', function () { \jp_require_auth(); (new CandidateController())->list(); });
$router->get('/candidates/get', function () { \jp_require_auth(); (new CandidateController())->get(); });
$router->get('/candidates/latest-conversation-meta', function () { \jp_require_auth(); (new CandidateController())->latestConversationMeta(); });
$router->get('/candidates/latest-conversation-content', function () { \jp_require_auth(); (new CandidateController())->latestConversationContent(); });
$router->get('/candidates/score-details', function () { \jp_require_auth(); (new CandidateController())->scoreDetails(); });
$router->get('/candidates/interview-decision', function () { \jp_require_auth(); (new CandidateController())->interviewDecision(); });
$router->post('/candidates/interview-decision/save', function () { \jp_require_auth(); (new CandidateController())->saveInterviewDecision(); });
$router->get('/candidates/notes', function () { \jp_require_auth(); (new CandidateController())->notes(); });
$router->post('/candidates/notes/save', function () { \jp_require_auth(); (new CandidateController())->saveNote(); });
$router->get('/candidates/resume/view', function () { \jp_require_auth(); (new CandidateController())->viewResume(); });
$router->post('/candidates/ai-parse-preview', function () { \jp_require_auth(); (new CandidateController())->aiParsePreview(); });
$router->post('/candidates/ai-parse-apply', function () { \jp_require_auth(); (new CandidateController())->aiParseApply(); });
$router->post('/candidates/store', function () { \jp_require_auth(); (new CandidateController())->store(); });
$router->post('/candidates/update', function () { \jp_require_auth(); (new CandidateController())->update(); });
$router->post('/candidates/delete', function () { \jp_require_auth(); (new CandidateController())->delete(); });

$router->get('/candidates/conversations', function () { \jp_require_auth(); (new ConversationController())->index(); });

$router->get('/conversations/show', [ConversationController::class, 'show']);
$router->get('/conversations/messages', [ConversationController::class, 'messagesAjax']);
$router->post('/conversations/send', [ConversationController::class, 'sendChatAjax']);
$router->post('/conversations/set-control-mode', [ConversationController::class, 'setControlModeAjax']);
$router->post('/conversations/resume-ai', [ConversationController::class, 'resumeAiAjax']);
$router->post('/conversations/store-ajax', [ConversationController::class, 'storeAjax']);
$router->post('/conversations/generate-candidate-chat-link', [ConversationController::class, 'generateCandidateChatLinkAjax']);
$router->post('/conversations/close-ajax', [ConversationController::class, 'closeAjax']);

$router->get('/candidate/chat', [CandidateChatController::class, 'show']);
$router->get('/candidate/chat/messages', [CandidateChatController::class, 'messagesAjax']);
$router->post('/candidate/chat/send', [CandidateChatController::class, 'sendAjax']);

$router->get('/dashboard', function () { \jp_require_auth(); (new DashboardController() )->index(); });
$router->get('/dashboard/interviews-by-date', function () { \jp_require_auth(); (new DashboardController())->interviewScheduleAjax(); });
$router->get('/process-applicants/manual', function () { \jp_require_nav_permission('process_applicants_manual'); (new ProcessApplicantsController())->manual(); });
$router->get('/process-applicants/app-received', function () { \jp_require_nav_permission('process_applicants_app_received'); (new ProcessApplicantsController())->appReceived(); });
$router->get('/process-applicants/app-received/list', function () { \jp_require_nav_permission('process_applicants_app_received'); (new ProcessApplicantsController())->appReceivedList(); });
$router->get('/process-applicants/app-received/remove-reasons', function () { \jp_require_nav_permission('process_applicants_app_received'); (new ProcessApplicantsController())->removeReasons(); });
$router->post('/process-applicants/app-received/remove', function () { \jp_require_nav_permission('process_applicants_app_received'); (new ProcessApplicantsController())->removeSelected(); });
$router->get('/process-applicants/app-received/score-details', function () { \jp_require_nav_permission('process_applicants_app_received'); (new ProcessApplicantsController())->scoreDetails(); });
$router->get('/process-applicants/resume/{applicant_pool_id}', function ($request, $response, $applicant_pool_id) { \jp_require_nav_permission('process_applicants_app_received'); (new ProcessApplicantsController())->resume((int) $applicant_pool_id); });
$router->get('/process-applicants/resume/view', function () { \jp_require_nav_permission('process_applicants_app_received'); (new ProcessApplicantsController())->viewResume(); });
$router->get('/process-applicants/batch', function () { \jp_require_nav_permission('process_applicants_batch'); (new ProcessApplicantsController())->batch(); });
$router->get('/ai/settings', function () { \jp_require_nav_permission('ai_settings'); (new AISettingsController())->index(); });
$router->post('/ai/settings/template/save', function () { \jp_require_nav_permission('ai_settings'); (new AISettingsController())->saveTemplate(); });
$router->post('/ai/settings/template/reset', function () { \jp_require_nav_permission('ai_settings'); (new AISettingsController())->resetTemplate(); });

$router->get('/office/settings', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->index(); });
$router->get('/office/settings/job-board-access-data', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->jobBoardAccessData(); });
$router->post('/office/settings/save-job-board-access', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->saveJobBoardAccess(); });
$router->get('/office/settings/schedule-data', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->scheduleData(); });
$router->post('/office/settings/save-schedule-profile', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->saveScheduleProfile(); });
$router->post('/office/settings/save-schedule-window', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->saveScheduleWindow(); });
$router->post('/office/settings/delete-schedule-window', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->deleteScheduleWindow(); });
$router->post('/office/settings/update-schedule-window', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->updateScheduleWindow(); });
$router->post('/office/settings/add-holiday', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->addHoliday(); });
$router->post('/office/settings/delete-holiday', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->deleteHoliday(); });
$router->post('/office/settings/save-ai-settings', function () { \jp_require_nav_permission('office_settings'); (new OfficeSettingController())->saveAiSettings(); });
