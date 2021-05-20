import pandas as pd
import math


def predict(df, idx):
	val = node_1(df, idx)
	prediction = cutoff(val)
	return prediction
	
def cutoff(val):
	if val >= 0.6:
		return 1
	else:
		return 0



def node_53():
	print("Result from node 53")
	return 0.52029903436818


def node_52():
	print("Result from node 52")
	return 0.43913368185212


def node_38():
	print("Result from node 38")
	return 0.40072576464489


def node_39():
	print("Result from node 39")
	return 0.56393315196268


def node_29(df, idx):
	'''
	Age.
	'''
		  
	print("Node 29")
	
	if df.loc[idx, 'age'] < 26.5 and math.isnan(df.loc[idx, 'age']) == False:
		return node_52()
	elif df.loc[idx, 'age'] >= 26.5 or math.isnan(df.loc[idx, 'age']) == True:
		return node_53()
	else:
		print("Error in node 29")
	

def node_28():
	print("Result from node 28")
	return 0.66350991417579


def node_23():
	print("Result from node 23")
	return 0.35954851629346


def node_22(df, idx):
	'''
	Question 1.a: In which field of study were you educated?
	'''

	print("Node 22")
	
	ans_if = ['Science', 'Health', 'Industry or craftsman', 'Pedagogical', 'Agricultural-, fisheries- and food']
	ans_else = ['Humanities, religion or aesthetics', 'Community-, office- and business', 'Transport and communication engineering', 'Education on public safety']
	
	if df.loc[idx, 'education'] in ans_if:
		return node_38()
	elif df.loc[idx, 'education'] in ans_else:
		return node_39()
	else:
		print("Error in node 22")
	

def node_21():
	print("Result from node 21")
	return 0.45642540620384


def node_20():
	print("Result from node 20")
	return 0.57111274871039


def node_17():
	print("Result from node 17")
	return 0.67168799009492


def node_16(df, idx):
	'''
	Employment rate past 36 months.
	'''
	
	print("Node 16")

	if df.loc[idx, 'bg36'] < 0.08086902343529 and math.isnan(df.loc[idx, 'bg36']) == False:
		return node_28()
	elif df.loc[idx, 'bg36'] >= 0.08086902343529 or math.isnan(df.loc[idx, 'bg36']) == True:
		return node_29(df, idx)
	else:
		print("Error in node 16")


def node_13(df, idx):
	'''
	Aggregate wage income for the last 12 completed months.
	'''
	
	print("Node 13")
	
	if df.loc[idx, 'wage'] < 14449 and math.isnan(df.loc[idx, 'wage']) == False:
		return node_22(df, idx)
	elif df.loc[idx, 'wage'] >= 14449 or math.isnan(df.loc[idx, 'wage']) == True:
		return node_23()
	else:
		print("Error in node 13")


def node_12(df, idx):
	'''
	Employment rate past 36 months.
	'''

	print("Node 12")

	if df.loc[idx, 'bg36'] >= 0.61967591148811 and math.isnan(df.loc[idx, 'bg36']) == False:
		return node_21()
	elif df.loc[idx, 'bg36'] < 0.61967591148811 or math.isnan(df.loc[idx, 'bg36']) == True:
		return node_20()
	else:
		print("Error in node 12")

def node_9():
	print("Result from node 9")
	return 0.68312461506877
	

def node_8(df, idx):
	'''
	Age.
	'''
	
	print("Node 8")

	if df.loc[idx, 'age'] >= 56.5 and math.isnan(df.loc[idx, 'age']) == False:
		return node_17()
	elif df.loc[idx, 'age'] < 56.5 or math.isnan(df.loc[idx, 'age']) == True:
		return node_16(df, idx)
	else:
		print("Error in node 8")
		
		
def node_7():
	print("Result from node 7")
	return 0.18906860011154


def node_6(df, idx):
	'''
	Origin.
	'''
	
	print("Node 6")
	
	ans_if = ["Western immigrant", "Western descendant"]
	ans_else = ["Danish", "Non-Western immigrant", "Non-Western descendant", float('nan')]
		   
	if df.loc[idx, 'origin'] in ans_if:
		return node_12(df, idx)
	elif df.loc[idx, 'origin'] in ans_else:
		return node_13(df, idx)
	else:
		print("Error in node 6")

def node_5():
	print("Result from node 5")
	return 0.83476098369715


def node_4(df, idx):
	'''
	Origin.
	'''
	
	print("Node 4")
	
	ans_if = ["Western immigrant", "Western descendant", "Non-Western descendant"]
	ans_else = ["Danish", "Non-Western immigrant", float('nan')]

	if df.loc[idx, 'origin'] in ans_if:
		return node_9()
	elif df.loc[idx, 'origin'] in ans_else:
		return node_8(df, idx)
	else:
		print("Error in node 4")


def node_3(df, idx):
	'''
	Question 2: How quickly do you believe that you will get a job?
	'''
	
	print("Node 3")
	
	ans_if = ["Within three months"]
	ans_else = ["I have a new job but haven't started yet", "Within one month"]
		   
	if df.loc[idx, 'prof_spm_02'] in ans_if:
		return node_6(df, idx)
	elif df.loc[idx, 'prof_spm_02'] in ans_else:
		return node_7()
	else:
		print("Error in node 2")


def node_2(df, idx):
	'''
	Question 2: How quickly do you believe that you will get a job?
	'''
	
	print("Node 2")
	
	ans_if = ["It will be more than 6 months", "I expect to go on maternity leave soon", "I expect to retire soon"]
	ans_else = ["I don't know", "Within six months"]
		   
	if df.loc[idx, 'prof_spm_02'] in ans_if:
		return node_5()
	elif df.loc[idx, 'prof_spm_02'] in ans_else:
		return node_4(df, idx)
	else:
		print("Error in node 2")


def node_1(df, idx):
	'''
	Question 2: How quickly do you believe that you will get a job?
	'''
	
	print("Node 1")
	
	ans_if = ["I don't know", "Within six months", "It will be more than 6 months", "I expect to go on maternity leave soon", "I expect to retire soon"]
	ans_else = ["I have a new job but haven't started yet", "Within one month", "Within three months"]
	
	if df.loc[idx, 'prof_spm_02'] in ans_if:
		return node_2(df, idx)
	elif df.loc[idx, 'prof_spm_02'] in ans_else:
		return node_3(df, idx)
	else:
		print("Error in node 1")
		
		
df = pd.read_csv('test.csv', sep = ';', header = 0, index_col = 0)
print(predict(df, 0))

