package com.scheduling.project.system.forecastdata.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.scheduling.framework.aspectj.lang.annotation.Log;
import com.scheduling.framework.aspectj.lang.enums.BusinessType;
import com.scheduling.project.system.forecastdata.domain.Forecastdata;
import com.scheduling.project.system.forecastdata.service.IForecastdataService;
import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.domain.AjaxResult;
import com.scheduling.common.utils.poi.ExcelUtil;
import com.scheduling.framework.web.page.TableDataInfo;

/**
 * 业务预测数据Controller
 *
 * @author scheduling
 * @date 2023-02-20
 */
@Controller
@RequestMapping("/system/forecastdata")
public class ForecastdataController extends BaseController
{
    private String prefix = "system/forecastdata";

    @Autowired
    private IForecastdataService forecastdataService;

    @RequiresPermissions("system:forecastdata:view")
    @GetMapping()
    public String forecastdata()
    {
        return prefix + "/forecastdata";
    }

    /**
     * 查询业务预测数据列表
     */
    @RequiresPermissions("system:forecastdata:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Forecastdata forecastdata)
    {
        startPage();
        List<Forecastdata> list = forecastdataService.selectForecastdataList(forecastdata);
        return getDataTable(list);
    }

    /**
     * 导出业务预测数据列表
     */
    @RequiresPermissions("system:forecastdata:export")
    @Log(title = "业务预测数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Forecastdata forecastdata)
    {
        List<Forecastdata> list = forecastdataService.selectForecastdataList(forecastdata);
        ExcelUtil<Forecastdata> util = new ExcelUtil<Forecastdata>(Forecastdata.class);
        return util.exportExcel(list, "业务预测数据数据");
    }

    /**
     * 新增业务预测数据
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存业务预测数据
     */
    @RequiresPermissions("system:forecastdata:add")
    @Log(title = "业务预测数据", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Forecastdata forecastdata)
    {
        return toAjax(forecastdataService.insertForecastdata(forecastdata));
    }

    /**
     * 修改业务预测数据
     */
    @RequiresPermissions("system:forecastdata:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Forecastdata forecastdata = forecastdataService.selectForecastdataById(id);
        mmap.put("forecastdata", forecastdata);
        return prefix + "/edit";
    }

    /**
     * 修改保存业务预测数据
     */
    @RequiresPermissions("system:forecastdata:edit")
    @Log(title = "业务预测数据", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Forecastdata forecastdata)
    {
        return toAjax(forecastdataService.updateForecastdata(forecastdata));
    }

    /**
     * 删除业务预测数据
     */
    @RequiresPermissions("system:forecastdata:remove")
    @Log(title = "业务预测数据", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(forecastdataService.deleteForecastdataByIds(ids));
    }
}
