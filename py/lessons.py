''' in this function to get a subgraph, I iterately ask each edges, which
    inefficient, and also, I only copy one-direction, what if this is a 
    bi-directioanl graph? what if I make a wrong direction?
'''
def cut(self, user_id_list):
    '''get a subset of social connection network.
    '''
    # DANGER: no only inefficient, this is actually a wrong implementation!
    sub_edges = []
    for end1, end2 in self.gr.edges():
        if user_id_list.count(end1) > 0\
           and user_id_list.count(end2) > 0:
            sub_edges.append((end1, end2))
    sub_netx = NetX(sub_edges)
    for end1, end2 in sub_netx.gr.edges():
        sub_netx.gr[end1][end2] = self.gr[end1][end2]

'''In a fruitful function, it is a good idea to ensure that every possible path 
through the pro- gram hits a return statement. This function is incorrect because 
if x happens to be 0, neither condition is true, and the function ends without hitting 
a return statement (return None, bug).
'''
def absolute_value(x):
    if x < 0:
        return -x
    if x > 0:
        return x
