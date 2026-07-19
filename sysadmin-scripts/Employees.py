class Employees:
	def _init_(self, name, department, role, salary, year_employed):
		self.name = name
		self.department = department
		self.salary = salary
		self.year = year
		self.year_employed = year_employed	
	
	def eligible_for_retirement(self):
		if self.year_employed >20:
			return True
		else :
			return False
