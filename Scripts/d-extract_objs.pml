load 6418-6517_aligned.pdb

set_view (\
     0.534421325,   -0.815990210,   -0.220345959,\
    -0.482305050,   -0.080326393,   -0.872313380,\
     0.694099009,    0.572455585,   -0.436485291,\
     0.000010939,    0.000004098,  -58.172981262,\
     48.423061371,   52.551383972,    6.932424545,\
    -164.967880249,  281.294006348,  -20.000000000 )

mystr1 = "6418-6517_aligned_000{}"
mystr2 = "anim_{}.wrl"
exec("for i in range(1, 10): cmd.disable('all'); cmd.enable(mystr1.format(i)); cmd.select('obj',mystr1.format(i)); cmd.select('obj2',mystr1.format(i)); cmd.select('obj_linker','resn Lys & obj & !(obj & bto name N + bto name C + name HA)'); cmd.select('obj_backbone','obj & !obj_linker'); cmd.color('green','obj_backbone'); cmd.color('yellow','obj_linker'); util.cnc('obj'); cmd.show('sticks','obj'); cmd.show('cartoon','obj'); print(i); cmd.delete('contacts'); cmd.distance('contacts','obj','obj2',3.6,2); cmd.enable('contacts'); cmd.hide('labels'); cmd.hide('everything','elem H'); cmd.set('dash_width', 2.5); cmd.show('sticks', '!elem H'); cmd.show('cartoon'); cmd.show('spheres', '!elem H'); cmd.show('dashes'); cmd.set('sphere_scale', 0.2); cmd.save(mystr2.format(i));")
mystr1 = "6418-6517_aligned_00{}"
exec("for i in range(11, 100): cmd.disable('all'); cmd.enable(mystr1.format(i)); cmd.select('obj',mystr1.format(i)); cmd.select('obj2',mystr1.format(i)); cmd.select('obj_linker','resn Lys & obj & !(obj & bto name N + bto name C + name HA)'); cmd.select('obj_backbone','obj & !obj_linker'); cmd.color('green','obj_backbone'); cmd.color('yellow','obj_linker'); util.cnc('obj'); cmd.show('sticks','obj'); cmd.show('cartoon','obj'); print(i); cmd.delete('contacts'); cmd.distance('contacts','obj','obj2',3.6,2); cmd.enable('contacts'); cmd.hide('labels'); cmd.hide('everything','elem H'); cmd.set('dash_width', 2.5); cmd.show('sticks', '!elem H'); cmd.show('cartoon'); cmd.show('spheres', '!elem H'); cmd.show('dashes'); cmd.set('sphere_scale', 0.2); cmd.save(mystr2.format(i));")
mystr1 = "6418-6517_aligned_0{}"
exec("for i in range(100, 101): cmd.disable('all'); cmd.enable(mystr1.format(i)); cmd.select('obj',mystr1.format(i)); cmd.select('obj2',mystr1.format(i)); cmd.select('obj_linker','resn Lys & obj & !(obj & bto name N + bto name C + name HA)'); cmd.select('obj_backbone','obj & !obj_linker'); cmd.color('green','obj_backbone'); cmd.color('yellow','obj_linker'); util.cnc('obj'); cmd.show('sticks','obj'); cmd.show('cartoon','obj'); print(i); cmd.delete('contacts'); cmd.distance('contacts','obj','obj2',3.6,2); cmd.enable('contacts'); cmd.hide('labels'); cmd.hide('everything','elem H'); cmd.set('dash_width', 2.5); cmd.show('sticks', '!elem H'); cmd.show('cartoon'); cmd.show('spheres', '!elem H'); cmd.show('dashes'); cmd.set('sphere_scale', 0.2); cmd.save(mystr2.format(i));")