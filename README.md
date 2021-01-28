# MeshlabAuto with PyMOL
Automation of Meshlab and PyMOL.
## Overview
[Meshlab](https://www.meshlab.net/#download) is an open source, portable, and extensible system for the processing and editing of unstructured 3D triangular meshes. PyMOL is a [paid-for](https://pymol.org/2/buy.html?q=buy) or [open source](https://github.com/schrodinger/pymol-open-source) molecular visualisation program. See [TheNerdJedi's original repo](https://github.com/TheNerdJedi/MeshlabAuto) for an introduction to automating MeshLab. This fork extends the functionality of MeshLabAuto by including a template for the automated extraction of 3D meshes from PyMOL, which can then be fed into scripts based on the original MeshLabAuto code.
### Automating PyMOl mesh extraction
PyMOL can export 3D models in a range of formats, but the .wrl format carries colour information that is useful for further rendering. Therefore, `.pml` scripts can be used to extract many 3D models from PyMOL in quick succession.You can place lumps of Python code within Python code blocks:
``` pml
python
readme_string = "Meshlab can work with {}"
print(readme_string.format("PyMOL!"))
python end
```
Alternatively, my approach utilitsed PyMOL's `exec()` command to combine string interpolation and for loops for the export of multiple 3D models.
#### Example .pml file for outputting 3D meshes
``` Python
load my-simulation_aligned.pdb # A .pdb file containing individual 'frames' of a molecular simulation.

set_view (\
     0.534421325,   -0.815990210,   -0.220345959,\
    -0.482305050,   -0.080326393,   -0.872313380,\
     0.694099009,    0.572455585,   -0.436485291,\
     0.000010939,    0.000004098,  -58.172981262,\
     48.423061371,   52.551383972,    6.932424545,\
    -164.967880249,  281.294006348,  -20.000000000 )  # The viewport we want to see our molecule from.

mystr1 = "my-simulation_aligned_000{}"
mystr2 = "anim_{}.wrl"

# Now we have three for loops which carry out the selection/editing of components of our model for each 'frame':

exec("for i in range(1, 10): cmd.disable('all'); cmd.enable(mystr1.format(i)); cmd.select('obj',mystr1.format(i)); cmd.select('obj2',mystr1.format(i)); cmd.select('obj_linker','resn Lys & obj & !(obj & bto name N + bto name C + name HA)'); cmd.select('obj_backbone','obj & !obj_linker'); cmd.color('green','obj_backbone'); cmd.color('yellow','obj_linker'); util.cnc('obj'); cmd.show('sticks','obj'); cmd.show('cartoon','obj'); print(i); cmd.delete('contacts'); cmd.distance('contacts','obj','obj2',3.6,2); cmd.enable('contacts'); cmd.hide('labels'); cmd.hide('everything','elem H'); cmd.set('dash_width', 2.5); cmd.show('sticks', '!elem H'); cmd.show('cartoon'); cmd.show('spheres', '!elem H'); cmd.show('dashes'); cmd.set('sphere_scale', 0.2); cmd.save(mystr2.format(i));")
mystr1 = "my-simulation_aligned_00{}"
exec("for i in range(11, 100): cmd.disable('all'); cmd.enable(mystr1.format(i)); cmd.select('obj',mystr1.format(i)); cmd.select('obj2',mystr1.format(i)); cmd.select('obj_linker','resn Lys & obj & !(obj & bto name N + bto name C + name HA)'); cmd.select('obj_backbone','obj & !obj_linker'); cmd.color('green','obj_backbone'); cmd.color('yellow','obj_linker'); util.cnc('obj'); cmd.show('sticks','obj'); cmd.show('cartoon','obj'); print(i); cmd.delete('contacts'); cmd.distance('contacts','obj','obj2',3.6,2); cmd.enable('contacts'); cmd.hide('labels'); cmd.hide('everything','elem H'); cmd.set('dash_width', 2.5); cmd.show('sticks', '!elem H'); cmd.show('cartoon'); cmd.show('spheres', '!elem H'); cmd.show('dashes'); cmd.set('sphere_scale', 0.2); cmd.save(mystr2.format(i));")
mystr1 = "my-simulation_aligned_0{}"
exec("for i in range(100, 101): cmd.disable('all'); cmd.enable(mystr1.format(i)); cmd.select('obj',mystr1.format(i)); cmd.select('obj2',mystr1.format(i)); cmd.select('obj_linker','resn Lys & obj & !(obj & bto name N + bto name C + name HA)'); cmd.select('obj_backbone','obj & !obj_linker'); cmd.color('green','obj_backbone'); cmd.color('yellow','obj_linker'); util.cnc('obj'); cmd.show('sticks','obj'); cmd.show('cartoon','obj'); print(i); cmd.delete('contacts'); cmd.distance('contacts','obj','obj2',3.6,2); cmd.enable('contacts'); cmd.hide('labels'); cmd.hide('everything','elem H'); cmd.set('dash_width', 2.5); cmd.show('sticks', '!elem H'); cmd.show('cartoon'); cmd.show('spheres', '!elem H'); cmd.show('dashes'); cmd.set('sphere_scale', 0.2); cmd.save(mystr2.format(i));")
```
This outputs 100 frames of animation of a molecule. When imported into the correct software, animations such as [these](https://youtu.be/M2PmvyApPMQ) are made possible.
