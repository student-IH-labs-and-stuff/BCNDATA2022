
def clean_operation(x):
    if 'VYBER' in x:
        return 'VYBER'
    elif 'PREVOD' in x:
        return 'PREVOD'
    elif 'VKLAD' in x:
        return 'VKLAD'
    else: 
        return 'UNKNOWN'

def clean_ksymbol(x):
    if x in ['', ' ']:
        return 'unknown'
    else:
        return x
    
def clean_duration(x):
    if x >36 and x<=60:
        return 48 
    else:
        return x
    
def clean_steps(data):
    data['operation']=data['operation'].apply(clean_operation)
    data['k_symbol'] = data['k_symbol'].apply(clean_ksymbol)
    data['duration']=data['duration'].apply(clean_duration)
    #data['duration']=list(map(clean_duration,data['duration'])) another way of writing the same
    return data 
