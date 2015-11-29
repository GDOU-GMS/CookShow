package com.blueshit.cookshow.test;

import com.blueshit.cookshow.service.ClassificationService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import org.junit.Test;

/**
 * Created by Seven on 2015/11/29.
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class TestService {

    @Autowired
    private ClassificationService classificationService;


    @Test
    public void test1(){
        System.out.println(classificationService.getTopClassificationNum()+"==========================");
    }


}
