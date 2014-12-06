package teammates.ui.controller;

import java.util.List;
import teammates.common.datatransfer.AccountAttributes;
import teammates.common.datatransfer.InstructorAttributes;

public class AdminInstructorsPageData extends PageData {
    
    public AdminInstructorsPageData(AccountAttributes account) {
        super(account);
    }
    public List<InstructorAttributes> instructors;
    public String currentinstructor;
    public String currentGoogleId;
    public String currentName;
    public String currentEmail;
    public String currentRol;
    public String currentCourseId;
    
    
}
