Dim stRepDNA,stRepProt,outRepDNA,outRepProt,scriptRepDNA,scriptRepProt,meshlabRepDesktop,mmeshlabRepLaptop,ext1,ext2

stRepDNA = "D:\testdir\dna_wrls"
stRepProt = "D:\testdir\\prot_wrls"
outRepDNA = "D:\testdir\\temp_objDNA"
outRepProt = "D:\testdir\temp_objProt"
outRepFinal = "D:\testdir\final_objProt\"
scriptRepDNA = "D:\testdir\simplify_DNA.mlx"
scriptRepProt = "D:\testdir\simplify_prot.mlx"
scriptRepMerge = "D:\testdir\merge_models.mlx"
meshlabRepDesktop = """D:\Program Files\VCG\MeshLab\meshlabserver.exe"""
projRep = "D:\testDir\projDir"
ext1 = "wrl"
ext2 = "obj"
dnaNameStart = outRepDNA  + "\out_surf_dna_" 
dnaNameEnd = ".wrl.obj"
protNameStart = outRepProt + "\out_surf_prot_" 
protNameEnd = ".wrl.obj"


Dim oFSO,oFl
Set oFSO = CreateObject("Scripting.FileSystemObject")

Set WshShell = WScript.CreateObject("WScript.Shell")

If oFSO.FolderExists(stRepDNA) Then
 For each oFl in  oFSO.GetFolder(stRepDNA).Files
   FOR EACH strExt in SPLIT(UCASE(ext1),",")
      IF RIGHT(UCASE(oFl),LEN(strExt)+1) = "." & strExt THEN
         'IF 64 BIT OS
         cmd = meshlabRepDesktop & "-i " & stRepDNA & "\" & oFl.Name & " -o " & outRepDNA & "\out_" & oFl.Name & ".obj -m vc fc -s " & scriptRepDNA
         WshShell.Run cmd,1,True
      END IF
   Next
 Next
End If

If oFSO.FolderExists(stRepProt) Then
 For each oFl in  oFSO.GetFolder(stRepProt).Files
   FOR EACH strExt in SPLIT(UCASE(ext1),",")
      IF RIGHT(UCASE(oFl),LEN(strExt)+1) = "." & strExt THEN
         'IF 64 BIT OS
         cmd = meshlabRepDesktop & "-i " & stRepProt & "\" & oFl.Name & " -o " & outRepProt & "\out_" & oFl.Name & ".obj -m vc fc -s " & scriptRepProt
         WshShell.Run cmd,1,True
      END IF
   Next
 Next
End If

For i = 1 To 30
  cmd = meshlabRepDesktop & "-i " & dnaNameStart & i & dnaNameEnd & " -i " & protNameStart & i & protNameEnd & " -o " & outRepFinal & "\anim_" & CStr(i) & ".obj -m fc -s " & scriptRepMerge
  WshShell.Run cmd,1,True
Next