package com.scheduling.project.system.customer.service;

import com.scheduling.project.system.customer.domain.Customer;
import com.scheduling.project.system.staff.domain.Staff;

import java.util.List;

/**
 * 员工管理Service接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface ICustomerService
{


    /**
     * 查询员工管理列表
     *
     * @param staff 员工管理
     * @return 员工管理集合
     */
    public List<Customer> selectCustomerList(Customer Customer);


}
