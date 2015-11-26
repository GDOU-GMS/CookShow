import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.service.AdminService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;

import java.util.List;

/**
 * Created by Seven on 2015/11/25.
 */



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class TestConfiguration {

    @Autowired
    private AdminService adminService;

    @Test
    public void testInit(){
        List<Admin> admins = adminService.findAll();

        System.out.println(admins.size());
    }




}
