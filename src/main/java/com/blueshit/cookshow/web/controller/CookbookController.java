package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/cookbook")
public class CookbookController extends BaseController {

    @RequestMapping("/createCookbook")
    public String createCookbook(){
        return "customer/cookbook/createcookbook";
    }


	@RequestMapping("/addCookbook")
	public String addCookbook(@ModelAttribute Cookbook cookbook){

		cookbookService.save(cookbook);

        //重定向到个人中心
		return "customer/cookbook/";
	}
	
	@RequestMapping("/deleteCookbook")
	public String deleteCookbook(@ModelAttribute Cookbook cookbook){
		
		
		
		cookbookService.save(cookbook);
		
		return "customer/cookbook/";
	}
	
	@RequestMapping("/modifyCookbook")
	public String modifyCookbook(@ModelAttribute Cookbook cookbook){
		
		
		
		cookbookService.save(cookbook);
		
		return "customer/cookbook/";
	}
}
	
