import json

def getPostValues(target):
    """
    解析post传参
    """
    res = {}
    for key in target:
        res[key] = target.getlist(key)[0]
    return res