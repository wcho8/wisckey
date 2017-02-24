/*
 * InfraOffice Alert Message Configuration
 * Date : 2013.06.20
 */

// Initialize
$.message = {};
$.message.common = {};
$.message.home = {};
$.message.report = {};
$.message.schedule = {};
$.message.address = {};
$.message.work = {};
$.message.contract = {};
$.message.maintenance = {};
$.message.board = {};
$.message.info = {};
$.message.admin = {};

// 공통 메세지
$.message.common.error = {
		load:"데이터를 불러오는데 오류가 발생하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.",
		save:"저장하는데 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.",
		del:"삭제하는데 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.",
		add:"추가하는데 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다."
};
$.message.common.confirm = {
		save:"저장하시겠습니까?",
		del:"삭제하시겠습니까?"
};
$.message.common.notification = {
		save:"저장되었습니다.",
		del:"삭제되었습니다.",
		add:"추가되었습니다.",
		wait:"잠시만 기다려주세요.",
		nocheck:"선택된 항목이 없습니다."
};
// 홈 메세지
// 보고서 메세지
// 일정 메세지
// 주소록 메세지
// 근태관리 메세지
// 계약관리 메세지
// 업무관리 메세지
// 게시함 메세지
// 사내정보 메세지
// 관리자 메세지