# The-Office-database-SQL
![Screenshot 2024-07-11 014646](https://github.com/ManishPradhan1/The-Office-database-SQL/assets/78529495/d89778d3-16ad-462a-b1ab-c5c105a3a0f8)
# Company Data Storage Requirements
The company is organized into branches. Each branch has a unique number, a name, and a particular employee who manages it.

The company makes it’s money by selling to clients. Each client has a name and a unique number to identify it.

The foundation of the company is it’s employees. Each employee has a name, birthday, sex, salary and a unique number.

An employee can work for one branch at a time, and each branch will be managed by one of the employees that work there. We’ll also want to keep track of when the current manager started as manager.

An employee can act as a supervisor for other employees at the branch, an employee may also act as the supervisor for employees at other branches. An employee can have at most one supervisor.

A branch may handle a number of clients, with each client having a name and a unique number to identify it. A single client may only be handled by one branch at a time.

Employees can work with clients controlled by their branch to sell them stuff. If nescessary multiple employees can work with the same client. We’ll want to keep track of how many dollars worth of stuff each employee sells to each client they work with.

Many branches will need to work with suppliers to buy inventory. For each supplier we’ll keep track of their name and the type of product they’re selling the branch. A single supplier may supply products to multiple branches.
# Company ER Diagram
![Compnay ER Diagram](https://github.com/ManishPradhan1/The-Office-database-SQL/assets/78529495/c975146b-159d-462a-ab51-34966014d1e0)
