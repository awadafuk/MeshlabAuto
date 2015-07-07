# MeshlabAuto
Automation of Meshlab


MeshLab is an open source, portable, and extensible system for the processing and editing 
of unstructured 3D triangular meshes.

An MLX file is a Meshlab Filter Script. Using an MLX we can drastically reduce the amount of time we spend on 
a mesh because we only have to run one script and not go through the process of a editing the whole file.

There are many great tutorials that introduce this and one can be included here:

http://www.andrewhazelden.com/blog/2012/04/automate-your-meshlab-workflow-with-mlx-filter-scripts/

This goes into greater depth on how to create a MLX script. I will be working on something a little different that doesn't
focus on that but focuses on using meshlabserver and how to implement differently.

I've just created a batch file with necessary loops and calls the .mlx file that will run the meshlabserver 
command. However one should know that the resulting files will be saved in the same directory where 
meshlabserver.exe is. You can find this file in the "Scripts" folder

## Windows(If you're not MeshLab Server friendly)      Pics Uploaded Soon

### Step 1:
Put the obj files you want to process into a folder with nothing else inside

### Step 2 (create a mlx file containing the operations you want to apply)
<ul>
<li> open meshlab
<li> import a mesh
<li> apply your filter(s)
<li> now under 'Filters' menu you have 'Show current filter script'
<li> click on "SaveScript" at the bottom and save your mlx file (not in the obj folder !)
<li> you can close meshlab (no need to save the scene)\
</ul>

### Step 3 (editing a simple vbs file and launch batch process)
<ul>
<li> Download the vbs script
<li> Edit the vbs file with notepad and replace with your folders where it's needed ( lines 5 / 6 )
<li> Save and double click on the vbs file.....et voila...!
</ul>

Each .OBJ should have been processed with the filters you choose in step 2 and the output obj files are prefixed with "OUT_" and saved in the same folder

PS: this is a 64 bit version, if you're using a 32 bit windows, just replace %ProgramFiles(x86)% (line 19) with %ProgramFiles%

## Mac

### Step 1:
Change the working directory to the meshlab frameworks folder to fix the Mac based QT framework issue

### Step 2:
On MAC OSX run meshlabserver from the current working directory

cd /Applications/meshlab.app/Contents/Frameworks/Applications/meshlab.app/Contents/MacOS/meshlabserver  -i ~/example.obj -o ~/example.obj -s ~/examplefilter.mlx -om vn   

Replace example.obj with object file and examplefilter.mlx with the Necessary Filter




