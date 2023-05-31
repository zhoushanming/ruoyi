package com.scheduling.project.system.customer.controller;

import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.page.TableDataInfo;
import com.scheduling.project.system.customer.domain.Customer;
import com.scheduling.project.system.customer.service.ICustomerService;
import com.scheduling.project.system.role.domain.Role;
import com.scheduling.project.system.staff.domain.Staff;
import com.scheduling.project.system.staff.service.IStaffService;
import com.scheduling.project.system.store.domain.Store;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/system/customer")
public class CustomerController extends BaseController {
    private String prefix = "system/customer";
    @RequiresPermissions("system:customer:view")
    @GetMapping()
    public String staff() {
        return prefix + "/customer";
    }
    @Autowired
    private ICustomerService customerService;
    /**
     * 查询员工管理列表
     */
    @RequiresPermissions("system:customer:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Customer Customer) {
        startPage();
        List<Customer> list = customerService.selectCustomerList(Customer);
        return getDataTable(list);
    }
}
