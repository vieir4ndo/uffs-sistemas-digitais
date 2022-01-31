a1 = [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1]
b1 = [0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1]
c1 = [0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]

a2 = [0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0]
b2 = [0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0]
c2 = [0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0]

ja = []
ka = []
jb = []
kb = []
jc = []
kc = []

for i in range(0, 16):
    if (a1[i] == 0 and a2[i] == 0):
        ja.append(0)
        ka.append(2)
    if (a1[i] == 0 and a2[i] == 1):
        ja.append(1)
        ka.append(2)
    if (a1[i] == 1 and a2[i] == 0):
        ja.append(2)
        ka.append(1)
    if (a1[i] == 1 and a2[i] == 1):
        ja.append(2)
        ka.append(0)

    if (b1[i] == 0 and b2[i] == 0):
        jb.append(0)
        kb.append(2)
    if (b1[i] == 0 and b2[i] == 1):
        jb.append(1)
        kb.append(2)
    if (b1[i] == 1 and b2[i] == 0):
        jb.append(2)
        kb.append(1)
    if (b1[i] == 1 and b2[i] == 1):
        jb.append(2)
        kb.append(0)

    if (c1[i] == 0 and c2[i] == 0):
        jc.append(0)
        kc.append(2)
    if (c1[i] == 0 and c2[i] == 1):
        jc.append(1)
        kc.append(2)
    if (c1[i] == 1 and c2[i] == 0):
        jc.append(2)
        kc.append(1)
    if (c1[i] == 1 and c2[i] == 1):
        jc.append(2)
        kc.append(0)

print("JA")
print(ja)
print("KA")
print(ka)
print("JB")
print(jb)
print("KB")
print(kb)
print("JC")
print(jc)
print("KC")
print(kc)
