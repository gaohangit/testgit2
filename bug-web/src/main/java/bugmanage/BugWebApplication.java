package bugmanage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication

@MapperScan("bugmanage.bugdao")
public class BugWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(BugWebApplication.class, args);
    }

}

