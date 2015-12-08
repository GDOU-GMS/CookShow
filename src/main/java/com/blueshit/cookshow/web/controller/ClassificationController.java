package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.listener.DataCacheListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/classification")
public class ClassificationController extends BaseController {
    


    @RequestMapping("/allClassification")
    public String allClassification(Model model){
        model.addAttribute("topClassificationList", DataCacheListener.classificationList);
        return "customer/classification/allclassification";
    }


}




