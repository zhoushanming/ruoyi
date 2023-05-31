package com.scheduling.project.system.customer.mapper;

import com.scheduling.project.system.customer.domain.Customer;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import com.scheduling.project.system.staff.domain.Staff;

import java.util.List;


/**
 * 员工管理Mapper接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface CustomerMapper
{

    /**
     * 查询员工管理列表
     *
     * @param staff 员工管理
     * @return 员工管理集合
     */
    public List<Customer> selectCustomerList(Customer customer);

}
