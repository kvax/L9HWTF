# L9HWTF
Lesson9HW Terraform

graph TD
    A[aws_infra] --> B[modules]
    A --> C[main.tf]
    A --> D[variables.tf]
    A --> E[outputs.tf]
    A --> F[provider.tf]
    A --> G[backend.tf]
    A --> H[README.md]
    
    B --> I[vpc]
    B --> J[alb]
    B --> K[asg]
    B --> L[rds]
    B --> M[security]
    
    I --> I1[main.tf]
    I --> I2[variables.tf]
    I --> I3[outputs.tf]
    
    J --> J1[main.tf]
    J --> J2[variables.tf]
    J --> J3[outputs.tf]
    
    K --> K1[main.tf]
    K --> K2[variables.tf]
    K --> K3[outputs.tf]
    
    L --> L1[main.tf]
    L --> L2[variables.tf]
    L --> L3[outputs.tf]
    
    M --> M1[main.tf]
    M --> M2[variables.tf]
    M --> M3[outputs.tf]