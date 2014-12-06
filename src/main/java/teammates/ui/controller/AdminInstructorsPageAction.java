package teammates.ui.controller;

import teammates.common.exception.EntityDoesNotExistException;
import teammates.common.util.Const;
import teammates.logic.api.GateKeeper;
import teammates.storage.api.InstructorsDb;

public class AdminInstructorsPageAction extends Action {

    private AdminInstructorsPageData data;
    @Override
    protected ActionResult execute() throws EntityDoesNotExistException {
        new GateKeeper().verifyAdminPrivileges(account);
        //AdminHomePageData data = new AdminHomePageData(account);//borrar        
        // data.instructorShortName = "";
        // data.instructorName = "";
        // data.instructorEmail = "";
        // data.instructorInstitution = "";        
        data = new AdminInstructorsPageData(account);
        InstructorsDb instructores = new InstructorsDb();
        data.instructors = instructores.getAllInstructors();
        data.currentinstructor = "" ;
        data.currentGoogleId = "" ;
        data.currentName = "" ;
        data.currentEmail = "" ;
        data.currentRol = "" ;
        data.currentCourseId = "" ;
        
        return createShowPageResult(Const.ViewURIs.ADMIN_INSTRUCTORS, data);
    }

}
