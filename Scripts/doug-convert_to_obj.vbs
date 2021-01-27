Dim stRep,scriptRep,meshLabRep,ext

stRep = "C:\Users\tadeo\OneDrive\Documents\EdAR\GitHub\edar-unity-core\Assets\DougHoustonAssets\anim_wrls"                                                                                       'Name of the directory where the .OBJs are
outRep1 = "C:\Users\tadeo\OneDrive\Documents\EdAR\GitHub\edar-unity-core\Assets\DougHoustonAssets\anim_objs"                                                                                       'Name of the first output directory
outRep2 = "C:\Users\tadeo\OneDrive\Documents\EdAR\GitHub\edar-unity-core\Assets\DougHoustonAssets\final_anim_objs"                                                                                       'Name of the final output directory
scriptRep = "C:\Users\tadeo\OneDrive\Documents\EdAR\GitHub\edar-unity-core\Assets\DougHoustonAssets\simplify_color_100000.mlx"                                                                 'Name of the directory where the .mlx file is
ext1 = "wrl"

Dim oFSO,oFl
Set oFSO = CreateObject("Scripting.FileSystemObject")

Set WshShell = WScript.CreateObject("WScript.Shell")

If oFSO.FolderExists(stRep) Then
 For each oFl in  oFSO.GetFolder(stRep).Files
   FOR EACH strExt in SPLIT(UCASE(ext1),",")
      IF RIGHT(UCASE(oFl),LEN(strExt)+1) = "." & strExt THEN
         'IF 64 BIT OS
         cmd = """C:\Program Files\VCG\MeshLab\meshlabserver.exe""" & "-i " & stRep & "\" & oFl.Name & " -o " & stRep & "\OUT_" & oFl.Name & ".obj -m vc fc -s " & scriptRep
         WshShell.Run cmd ,1,True
      END IF
   Next
 Next
End If