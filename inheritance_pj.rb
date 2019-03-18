class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(mutiplier)
    @salary * mutiplier
  end

  def to_s
    @name
  end
end



class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees=[]
  end

  def bonus(mutiplier)
    employees_salary = @employees.map{|em| em.salary}
    employees_salary.sum * mutiplier
  end
end

# ned.bonus(5) # => 500_000
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000