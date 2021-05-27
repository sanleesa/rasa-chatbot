import json
def get_degree_name(user_degree):
    degree_names = {}
    with open("level2synonyms.json", "rt") as degree_name_list:
        degree_names = json.load(degree_name_list)
    print(degree_names)
    if (user_degree in degree_names.keys()):
        return degree_names[user_degree]
    return []
        
print(get_degree_name('bsc'))