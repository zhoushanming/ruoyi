package com.scheduling.project.system.cust.controller;

import com.scheduling.common.utils.poi.ExcelUtil;
import com.scheduling.framework.aspectj.lang.annotation.Log;
import com.scheduling.framework.aspectj.lang.enums.BusinessType;
import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.domain.AjaxResult;
import com.scheduling.framework.web.page.TableDataInfo;
import com.scheduling.project.system.cust.domain.Cust;
import com.scheduling.project.system.cust.mapper.CustMapper;
import com.scheduling.project.system.cust.service.ICustService;
import com.scheduling.project.system.role.domain.Role;
import com.scheduling.project.system.role.mapper.RoleMapper;
import com.scheduling.project.system.store.domain.Store;
import com.scheduling.project.system.store.mapper.StoreMapper;
import org.apache.poi.hpsf.Decimal;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * 员工管理Controller
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Controller
@RequestMapping("/system/cust")
public class CustController extends BaseController {
    private String prefix = "system/cust";

    @Autowired
    private ICustService custService;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private CustMapper custMapper;
    @Autowired
    private StoreMapper storeMapper;


    @RequiresPermissions("system:cust:view")
    @GetMapping()
    public String cust() {
        return prefix + "/cust";
    }

    /**
     * 查询员工管理列表
     */
    @RequiresPermissions("system:cust:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Cust cust) {
        startPage();
        List<Cust> list = custService.selectCustList(cust);
        return getDataTable(list);
    }

    /**
     * 导出员工管理列表
     */
    @RequiresPermissions("system:cust:export")
    @Log(title = "员工管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Cust cust) {
        List<Cust> list = custService.selectCustList(cust);
        ExcelUtil<Cust> util = new ExcelUtil<Cust>(Cust.class);
        return util.exportExcel(list, "员工管理数据");
    }

    /**
     * 新增员工管理
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存员工管理
     */
    @RequiresPermissions("system:cust:add")
    @Log(title = "员工管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Cust cust) {
        return toAjax(custService.insertCust(cust));
    }

    /**
     * 修改员工管理
     */
    @RequiresPermissions("system:cust:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Cust cust = custService.selectCustById(id);
        mmap.put("cust", cust);
        return prefix + "/edit";
    }

    /**
     * 修改员工管理
     */
    @RequiresPermissions("system:cust:recharge")
    @GetMapping("/recharge/{id}")
    public String recharge(@PathVariable("id") Long id, ModelMap mmap) {
        Cust cust = custService.selectCustById(id);
        mmap.put("cust", cust);
        return prefix + "/recharge";
    }

    /**
     * 修改员工管理
     */
    @RequiresPermissions("system:cust:consume")
    @GetMapping("/consume/{id}")
    public String consume(@PathVariable("id") Long id, ModelMap mmap) {
        Cust cust = custService.selectCustById(id);
        mmap.put("cust", cust);
        return prefix + "/consume";
    }
    @PostMapping("/listname")
    @ResponseBody
    public List<Cust> lists1(String custId)
    {
        logger.info("----------"+custId);
        List<Cust> cust=custMapper.selectCustByName(custId);
        return cust;

    }

    /**
     * 修改保存员工管理
     */
    @RequiresPermissions("system:cust:edit")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Cust cust) {
        return toAjax(custService.updateCust(cust));
    }

    /**
     * 金额充值
     */
    @RequiresPermissions("system:cust:recharge")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PostMapping("/recharge")
    @ResponseBody
    public AjaxResult recharge(Cust cust) {
        BigDecimal recharge = cust.getRecharge();
        BigDecimal balance =  recharge.add(cust.getBalance());
        cust.setBalance(balance);
        return toAjax(custService.updateCust(cust));
    }

    /**
     * 消费
     */
    @RequiresPermissions("system:cust:consume")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PostMapping("/consume")
    @ResponseBody
    public AjaxResult consume(Cust cust) {
        BigDecimal consume = cust.getConsume();
        BigDecimal discount = cust.getDiscount();
        BigDecimal afterConsume =  consume.multiply(discount.divide(new BigDecimal(100)));
        BigDecimal balance = cust.getBalance();
        balance=balance.subtract(afterConsume);
        cust.setBalance(balance);
        return toAjax(custService.updateCust(cust));
    }


    /**
     * 删除员工管理
     */
    @RequiresPermissions("system:cust:remove")
    @Log(title = "员工管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(custService.deleteCustByIds(ids));
    }


}
