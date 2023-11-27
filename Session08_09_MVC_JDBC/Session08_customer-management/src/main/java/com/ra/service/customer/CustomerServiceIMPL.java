package com.ra.service.customer;

import com.ra.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceIMPL implements ICustomerService {

    public static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer(1, "John", "john@rikkei.academy", "Hanoi"));
        customerList.add(new Customer(2, "Bill", "bill@rikkei.academy", "Danang"));
        customerList.add(new Customer(3, "Alex", "alex@rikkei.academy", "Saigon"));
        customerList.add(new Customer(4, "Adam", "adam@rikkei.academy", "Beijin"));
        customerList.add(new Customer(5, "Sophia", "sophia@rikkei.academy", "Miami"));
        customerList.add(new Customer(6, "Rose", "rose@rikkei.academy", "Newyork"));
    }

    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public void save(Customer customer) {
        Customer editedCustomer = findById(customer.getCustomerId());
        if (editedCustomer == null) {
            customerList.add(customer);
        } else {
            customerList.set(customerList.indexOf(editedCustomer), customer);
        }
    }

    @Override
    public void deleteById(int id) {
        customerList.remove(findById(id));
    }

    @Override
    public Customer findById(int id) {
        for (Customer customer : customerList) {
            if (customer.getCustomerId() == id) {
                return customer;
            }
        }
        return null;
    }

    @Override
    public int getNewId() {
        int idMax = 0;
        for (Customer customer : customerList) {
            if (idMax < customer.getCustomerId()) {
                idMax = customer.getCustomerId();
            }
        }
        return idMax + 1;
    }

    @Override
    public List<Customer> findByName(String name) {
        List<Customer> customers = new ArrayList<>();
        for (Customer customer : customerList) {
            if (customer.getCustomerName().toLowerCase().contains(name.trim().toLowerCase())) {
                customers.add(customer);
            }
        }
        return customers;
    }
}
