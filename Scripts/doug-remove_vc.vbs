Dim stRep,scriptRep,meshLabRep,ext

stRep = "D:\testDir\anim_objs"                                                                                       'Name of the directory where the .OBJs are
outRep = "C:\Users\tadeo\OneDrive\Documents\EdAR\GitHub\edar-unity-core\Assets\DougHoustonAssets\final_anim_objs"                                                                                       'Name of the directory where you want to output .OBJs
ext1 = "obj"

Dim oFSO,oFl
Set oFSO = CreateObject("Scripting.FileSystemObject")

Set WshShell = WScript.CreateObject("WScript.Shell")

If oFSO.FolderExists(stRep) Then
 For each oFl in  oFSO.GetFolder(stRep).Files
   FOR EACH strExt in SPLIT(UCASE(ext1),",")
      IF RIGHT(UCASE(oFl),LEN(strExt)+1) = "." & strExt THEN
         'IF 64 BIT OS
         cmd = """C:\Program Files\VCG\MeshLab\meshlabserver.exe""" & "-i " & stRep & "\" & oFl.Name & " -o " & outRep & "\FINAL_" & oFl.Name & " -m fc"
         WshShell.Run cmd ,1,True
      END IF
   Next
 Next
End If