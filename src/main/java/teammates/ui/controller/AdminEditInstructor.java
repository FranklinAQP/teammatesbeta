package teammates.ui.controller;

import teammates.common.exception.EntityDoesNotExistException;
import teammates.common.util.Const;
import teammates.common.util.Sanitizer;
import teammates.logic.api.GateKeeper;
import teammates.storage.api.InstructorsDb;


public class AdminEditInstructor extends Action {

    private AdminInstructorsPageData data;
    @Override
    protected ActionResult execute() throws EntityDoesNotExistException {
        new GateKeeper().verifyAdminPrivileges(account);
            
        data = new AdminInstructorsPageData(account);
        InstructorsDb instructores = new InstructorsDb();
        
        data.currentName = getRequestParamValue(Const.ParamsNames.INSTRUCTOR_NAME);
        data.currentEmail = getRequestParamValue(Const.ParamsNames.INSTRUCTOR_EMAIL);
        data.currentCourseId = getRequestParamValue(Const.ParamsNames.COURSE_ID);
        data.currentRol = getRequestParamValue(Const.ParamsNames.INSTRUCTOR_ROLE_NAME);
        data.currentGoogleId = getRequestParamValue("user_id_instructor");
        
        data.currentName = Sanitizer.sanitizeName(data.currentName);
        data.currentEmail = Sanitizer.sanitizeName(data.currentEmail);
        data.currentCourseId = Sanitizer.sanitizeName(data.currentCourseId);
        data.currentRol = Sanitizer.sanitizeName(data.currentRol);
        data.currentGoogleId = Sanitizer.sanitizeName(data.currentGoogleId);
        
        return createShowPageResult(Const.ViewURIs.ADMIN_EDIT_INSTRUCTOR, data);
    }

}
