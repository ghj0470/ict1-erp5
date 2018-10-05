package com.ict.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.erp.service.LevelInfoService;
import com.ict.erp.vo.LevelInfo;

@Controller
public class LevelInfoController {

	@Autowired
	private LevelInfoService lis;

	@RequestMapping(value = "/levelinfo", method = RequestMethod.GET)
	@ResponseBody
	public List<LevelInfo> getLevelInfoList(@ModelAttribute LevelInfo li) {
		//System.out.println(li);
		return lis.getLevelInfoList(li);
	}

	/*
	 * @RequestMapping(value="/levelinfo2",method=RequestMethod.GET) public
	 * ModelAndView getLevelInfoList2(
	 * 
	 * @ModelAttribute LevelInfo li, ModelAndView mav ) {
	 * mav.setViewName("levelinfo/list");
	 * mav.addObject("liList",lis.getLevelInfoList(li)); return mav; }
	 */
	@RequestMapping(value="/levelinfo/{linum}",method=RequestMethod.GET)
	@ResponseBody
	public  LevelInfo getLevelInfo(@PathVariable Integer linum) {
		return lis.getLevelInfo(linum);
	}
	@RequestMapping(value="/levelinfo",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertLevelInfo(@RequestBody LevelInfo li) {
		return lis.insertLevelInfo(li);
	}
	@RequestMapping(value="/levelinfo/{linum}",method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteLevelInfo(@PathVariable int linum) {
		return lis.deleteLevelInfo(linum)+"";
	}
	
	@RequestMapping(value="/levelinfo/{linum}",method=RequestMethod.PUT)
	@ResponseBody 
	public Integer updateLevelInfo(@RequestBody LevelInfo li,@PathVariable Integer linum) {
		li.setLinum(linum);
		return lis.updateLevelInfo(li); 
	}
}
