/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

//import controllers.DepartmentController;
//import controllers.EmployeeController;
//import controllers.JobController;
//import controllers.RegionController;
//import controllers.UserAccountController;

import daos.GeneralDao;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;
import models.Country;
import models.Department;
import models.Employee;
import models.Job;
import models.Location;
import models.Region;
import models.UserAccount;
import org.hibernate.Session;

/**
 *
 * @author Elsa
 */
public class ManualTest {

    public static void main(String[] args) throws ParseException {
        //System.out.println(HibernateUtil.getSessionFactory());
        // Session session=HibernateUtil.getSessionFactory().openSession();

//        Region region=new Region();
//        region.setRegionId(new BigDecimal(13));
//        region.setRegionName("Jekate");
//        RegionDao regiondao=new RegionDao();
        //System.out.println(regiondao.createRegion(region));
        // System.out.println(regiondao.deleteRegion(region));
        //System.out.println(regiondao.updateRegion(region));
        // List<Region> rs=regiondao.selectRegions();
//        for (Region r : rs) {
//            System.out.println("ID : "+r.getRegionId()+
//                    "\nName : "+r.getRegionName());
//        }
//        Region region=new RegionDao().selectById(4);
//        System.out.println(region.getRegionName());
        //SEARCH 
//            List<Region> regions=new RegionDao().searchRegions("2");
//            for (Region region : regions) {
//            Region r=region;
//                System.out.println(r.getRegionName());
//        }
        //GET ALL USE CONTROLLER
//        List<Region> rc=new RegionController().getAll();
//        for (Region region : rc) {
//        System.out.println(region.getRegionId()+" "+region.getRegionName());
//            for (Country country : region.getCountryList()) {
//                System.out.println("-"+country.getCountryName());
//                for (Location location : country.getLocationList()) {
//                    System.out.println("- -"+location.getCity());
//                    for (Department department : location.getDepartmentList()) {
//                        System.out.println("++"+department.getDepartmentName());
//                    }
//                }
//            }
//            
//        }
        //CREATE USE CONTROLLER
//        Region region = new Region();
//        RegionController controller = new RegionController();
//        System.out.println(controller.create(6, "Meikartaulalala"));
//        
//        List<Region> rc=new RegionController().getAll();
//        for (Region region1 : rc) {
//            System.out.println(region1.getRegionId()+" "+region1.getRegionName());
//        }
//        
        //UPDATE USE CONTROLLER
//        Region region = new Region();
//        RegionController controller = new RegionController();
//        System.out.println(controller.update(6, "ULALALA"));
//        
//        List<Region> rs=new RegionController().getAll();
//        for (Region region2 : rs) {
//            System.out.println(region2.getRegionId()+" "+region2.getRegionName());
//        }
        //DELETE USE CONTROLLER
//        RegionController regionController=new RegionController();
//        System.out.println(regionController.delete("13"));
//        
//        List<Region> rd=new RegionController().getAll();
//        for (Region region3 : rd) {
//            System.out.println(region3.getRegionId()+" "+region3.getRegionName());
//        }
        //SELECT EMPLOYEE
//        List<Employee> rc=new EmployeeController().getAll();
//        for (Employee employee : rc) {
//            System.out.println(employee.getEmployeeId()+" "+employee.getFirstName());
//        }
        //CREATE EMPLOYEE USE CONTROLLER (masih gagal)
        //EmployeeController controller = new EmployeeController();
        //controller.create("4", "huhu", "hehe", "huhe", "1111", "2019-01-13", "700", "0", "100", "PU_MAN", "60");
        //FUNGSI DELETE
        ///controller.delete("2");
        //System.out.println(controller.selectByName("Steven", "King").getJobId().getJobTitle());
//        
//        List<Employee> emp=new EmployeeController().getAll();
//        for (Employee employee1 : emp) {
//            System.out.println(employee1.getEmployeeId()+" "+employee1.getFirstName()+" "+employee1.getDepartmentId().getDepartmentName());
//        }
        //SELECT BY JOB USE CONTROLLER 
//        Job j=new JobController().selectByName("Programmer");
//        System.out.println(j.getJobId());
        //SELECT BY NAME OF EMPLOYEE USE CONTROLLER AND RELATIONAL SHOW OF JOB 
//        Employee e=new EmployeeController().selectByName("Neena");
//        System.out.println(e.getEmployeeId()+" "
//                +e.getFirstName()+" "
//                +e.getJobId().getJobTitle());
//        Department d=new DepartmentController().selectByName("Administration");
//        System.out.println(d.getDepartmentId()+" "+d.getDepartmentName()+" "+d.getManagerId().getFirstName());
//        Job job=new JobController().selectByName("Sales");
//        System.out.println(job.getJobTitle());
        //SEARCH JOB USE CONTROLLER
//        List<Job> job=new JobController().searchJob("IT_PROG");
//           for (Job job1 : job) {
//               System.out.println(job1.getJobTitle());
//        }
//        List<Job> jobs=new JobController().getAll();
//        for (Job job : jobs) {
//            System.out.println(job.getJobId()+" "+job.getJobTitle());
//        }
//        GeneralDao dao = new GeneralDao(HibernateUtil.getSessionFactory());
//     Region region= new Region();
//        region.setRegionId(9);
//        region.setRegionName("Pekanbaru");
//      System.out.println(dao.save(region));
//
//        Country country=new Country("ER", "BALIi", region);
//        System.out.println(dao.save(country));
//
//     Location location=new Location(BigDecimal.valueOf(21), "Tanjung Duren", "1C", "TIMUR", "JAKARTA", country);
     //   System.out.println(dao.save(location));
    //    System.out.println(dao.delete(location));
//        List<Location> l=dao.select("from Location");
//        for (Location location1: l ) {
//            System.out.println(location1.getCity());
//        }

     //
      
//        RegionController uja= new RegionController();
//        //uja.regis("5", "tes", "tes");
//        System.out.println(uja.getAll());


        
//          UserAccountController accountController=new UserAccountController();
//         
//         boolean b=  accountController.selectByName("demen");
//         if(b){
//             System.out.println("uname  tersedia");
//
//        }
//         else{
//             System.out.println("uname tidak tersedia");
//         }
    }
}
