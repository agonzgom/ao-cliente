Attribute VB_Name = "Carga"
Option Explicit

Private FileManager As clsIniManager

Public Sub CargarCabezas()
On Error GoTo errhandler:

    Dim N As Integer
    Dim i As Long
    Dim Numheads As Integer
    Dim Miscabezas() As tIndiceCabeza
    
    N = FreeFile()
    Open Game.path(INIT) & "Cabezas.ind" For Binary Access Read As #N
    
    'cabecera
    Get #N, , MiCabecera
    
    'num de cabezas
    Get #N, , Numheads
    
    'Resize array
    ReDim HeadData(0 To Numheads) As HeadData
    ReDim Miscabezas(0 To Numheads) As tIndiceCabeza
    
    For i = 1 To Numheads
        Get #N, , Miscabezas(i)
        
        If Miscabezas(i).Head(1) Then
            Call InitGrh(HeadData(i).Head(1), Miscabezas(i).Head(1), 0)
            Call InitGrh(HeadData(i).Head(2), Miscabezas(i).Head(2), 0)
            Call InitGrh(HeadData(i).Head(3), Miscabezas(i).Head(3), 0)
            Call InitGrh(HeadData(i).Head(4), Miscabezas(i).Head(4), 0)
        End If
    Next i
    
    Close #N
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo Cabezas.ind no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub

Sub CargarCascos()
On Error GoTo errhandler:

    Dim N As Integer
    Dim i As Long
    Dim NumCascos As Integer

    Dim Miscabezas() As tIndiceCabeza
    
    N = FreeFile()
    Open Game.path(INIT) & "Cascos.ind" For Binary Access Read As #N
    
    'cabecera
    Get #N, , MiCabecera
    
    'num de cabezas
    Get #N, , NumCascos
    
    'Resize array
    ReDim CascoAnimData(0 To NumCascos) As HeadData
    ReDim Miscabezas(0 To NumCascos) As tIndiceCabeza
    
    For i = 1 To NumCascos
        Get #N, , Miscabezas(i)
        
        If Miscabezas(i).Head(1) Then
            Call InitGrh(CascoAnimData(i).Head(1), Miscabezas(i).Head(1), 0)
            Call InitGrh(CascoAnimData(i).Head(2), Miscabezas(i).Head(2), 0)
            Call InitGrh(CascoAnimData(i).Head(3), Miscabezas(i).Head(3), 0)
            Call InitGrh(CascoAnimData(i).Head(4), Miscabezas(i).Head(4), 0)
        End If
    Next i
    
    Close #N
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo Cascos.ind no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub

Sub CargarCuerpos()
On Error GoTo errhandler:

    Dim N As Integer
    Dim i As Long
    Dim NumCuerpos As Integer
    Dim MisCuerpos() As tIndiceCuerpo
    
    N = FreeFile()
    Open Game.path(INIT) & "Personajes.ind" For Binary Access Read As #N
    
    'cabecera
    Get #N, , MiCabecera
    
    'num de cabezas
    Get #N, , NumCuerpos
    
    'Resize array
    ReDim BodyData(0 To NumCuerpos) As BodyData
    ReDim MisCuerpos(0 To NumCuerpos) As tIndiceCuerpo
    
    For i = 1 To NumCuerpos
        Get #N, , MisCuerpos(i)
        
        If MisCuerpos(i).Body(1) Then
            Call InitGrh(BodyData(i).Walk(1), MisCuerpos(i).Body(1), 0)
            Call InitGrh(BodyData(i).Walk(2), MisCuerpos(i).Body(2), 0)
            Call InitGrh(BodyData(i).Walk(3), MisCuerpos(i).Body(3), 0)
            Call InitGrh(BodyData(i).Walk(4), MisCuerpos(i).Body(4), 0)
            
            BodyData(i).HeadOffset.X = MisCuerpos(i).HeadOffsetX
            BodyData(i).HeadOffset.Y = MisCuerpos(i).HeadOffsetY
        End If
    Next i
    
    Close #N
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo Personajes.ind no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub

Sub CargarFxs()
On Error GoTo errhandler:

    Dim N As Integer
    Dim i As Long
    Dim NumFxs As Integer
    
    N = FreeFile()
    Open Game.path(INIT) & "Fxs.ind" For Binary Access Read As #N
    
    'cabecera
    Get #N, , MiCabecera
    
    'num de cabezas
    Get #N, , NumFxs
    
    'Resize array
    ReDim FxData(0 To NumFxs) As tIndiceFx
    
    For i = 1 To NumFxs
        Get #N, , FxData(i)
        'MsgBox FxData(i).Animacion & FxData(i).OffsetX
    Next i
    
    Close #N

errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo Fxs.ind no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If

End Sub

Sub CargarTips()
On Error GoTo errhandler:

    Dim N As Integer
    Dim i As Long
    Dim NumTips As Integer
    
    N = FreeFile
    Open Game.path(INIT) & "Tips.ayu" For Binary Access Read As #N
    
    'cabecera
    Get #N, , MiCabecera
    
    'num de cabezas
    Get #N, , NumTips
    
    'Resize array
    ReDim Tips(1 To NumTips) As String * 255
    
    For i = 1 To NumTips
        Get #N, , Tips(i)
    Next i
    
    Close #N
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo Tips.ayu no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub

Sub CargarArrayLluvia()
On Error GoTo errhandler:

    Dim N As Integer
    Dim i As Long
    Dim Nu As Integer
    
    N = FreeFile()
    Open Game.path(INIT) & "fk.ind" For Binary Access Read As #N
    
    'cabecera
    Get #N, , MiCabecera
    
    'num de cabezas
    Get #N, , Nu
    
    'Resize array
    ReDim bLluvia(1 To Nu) As Byte
    
    For i = 1 To Nu
        Get #N, , bLluvia(i)
    Next i
    
    Close #N
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo fk.ind no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub

Sub CargarAnimArmas()
On Error GoTo errhandler:

    Dim LoopC As Long

    Set FileManager = New clsIniManager
    Call FileManager.Initialize(Game.path(INIT) & "armas.dat")
    NumWeaponAnims = Val(FileManager.GetValue("INIT", "NumArmas"))
    ReDim WeaponAnimData(1 To NumWeaponAnims) As WeaponAnimData
    
    For LoopC = 1 To NumWeaponAnims
        Call InitGrh(WeaponAnimData(LoopC).WeaponWalk(1), Val(FileManager.GetValue("ARMA" & LoopC, "Dir1")), 0)
        Call InitGrh(WeaponAnimData(LoopC).WeaponWalk(2), Val(FileManager.GetValue("ARMA" & LoopC, "Dir2")), 0)
        Call InitGrh(WeaponAnimData(LoopC).WeaponWalk(3), Val(FileManager.GetValue("ARMA" & LoopC, "Dir3")), 0)
        Call InitGrh(WeaponAnimData(LoopC).WeaponWalk(4), Val(FileManager.GetValue("ARMA" & LoopC, "Dir4")), 0)
    Next LoopC
    
    Set FileManager = Nothing
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo armas.dat no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If

End Sub


Public Sub CargarColores()
On Error GoTo errhandler:

    Set FileManager = New clsIniManager
    Call FileManager.Initialize(Game.path(INIT) & "colores.dat")
    
    Dim i As Long
    
    For i = 0 To 47 '48, 49 y 50 reservados para atacables, ciudadano y criminal
        ColoresPJ(i) = D3DColorXRGB(FileManager.GetValue(CStr(i), "R"), FileManager.GetValue(CStr(i), "G"), FileManager.GetValue(CStr(i), "B"))
    Next i
    
    '   Crimi
    ColoresPJ(50) = D3DColorXRGB(FileManager.GetValue("CR", "R"), FileManager.GetValue("CR", "G"), FileManager.GetValue("CR", "B"))

    '   Ciuda
    ColoresPJ(49) = D3DColorXRGB(FileManager.GetValue("CI", "R"), FileManager.GetValue("CI", "G"), FileManager.GetValue("CI", "B"))
    
    '   Atacable TODO: hay que implementar un color para los atacables y hacer que funcione.
    'ColoresPJ(48) = D3DColorXRGB(FileManager.GetValue("AT", "R"), FileManager.GetValue("AT", "G"), FileManager.GetValue("AT", "B"))
    
    For i = 51 To 56 'Colores reservados para la renderizacion de dano
        ColoresDano(i) = D3DColorXRGB(FileManager.GetValue(CStr(i), "R"), FileManager.GetValue(CStr(i), "G"), FileManager.GetValue(CStr(i), "B"))
    Next i
    
    Set FileManager = Nothing
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo colores.dat no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub

Sub CargarAnimEscudos()
On Error GoTo errhandler:

    Dim LoopC As Long
    Dim NumEscudosAnims As Integer
    
    Set FileManager = New clsIniManager
    Call FileManager.Initialize(Game.path(INIT) & "escudos.dat")
    
    NumEscudosAnims = Val(FileManager.GetValue("INIT", "NumEscudos"))
    
    ReDim ShieldAnimData(1 To NumEscudosAnims) As ShieldAnimData
    
    For LoopC = 1 To NumEscudosAnims
        Call InitGrh(ShieldAnimData(LoopC).ShieldWalk(1), Val(FileManager.GetValue("ESC" & LoopC, "Dir1")), 0)
        Call InitGrh(ShieldAnimData(LoopC).ShieldWalk(2), Val(FileManager.GetValue("ESC" & LoopC, "Dir2")), 0)
        Call InitGrh(ShieldAnimData(LoopC).ShieldWalk(3), Val(FileManager.GetValue("ESC" & LoopC, "Dir3")), 0)
        Call InitGrh(ShieldAnimData(LoopC).ShieldWalk(4), Val(FileManager.GetValue("ESC" & LoopC, "Dir4")), 0)
    Next LoopC
    
    Set FileManager = Nothing
    
errhandler:
    
    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo escudos.dat no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub

Public Sub CargarHechizos()
'********************************
'Author: Shak
'Last Modification:
'Cargamos los hechizos del juego. [Solo datos necesarios]
'********************************
On Error GoTo errorH

    Dim J As Long
    
    Set FileManager = New clsIniManager
    Call FileManager.Initialize(Game.path(INIT) & "Hechizos.dat")

    NumHechizos = Val(FileManager.GetValue("INIT", "NumHechizos"))
 
    ReDim Hechizos(1 To NumHechizos) As tHechizos
    For J = 1 To NumHechizos
        With Hechizos(J)
            .Desc = FileManager.GetValue("HECHIZO" & J, "Desc")
            .PalabrasMagicas = FileManager.GetValue("HECHIZO" & J, "PalabrasMagicas")
            .Nombre = FileManager.GetValue("HECHIZO" & J, "Nombre")
            .SkillRequerido = FileManager.GetValue("HECHIZO" & J, "MinSkill")
         
            If J <> 38 And J <> 39 Then
                .EnergiaRequerida = FileManager.GetValue("HECHIZO" & J, "StaRequerido")
                 
                .HechiceroMsg = FileManager.GetValue("HECHIZO" & J, "HechizeroMsg")
                .ManaRequerida = FileManager.GetValue("HECHIZO" & J, "ManaRequerido")
             
                .PropioMsg = FileManager.GetValue("HECHIZO" & J, "PropioMsg")
                .TargetMsg = FileManager.GetValue("HECHIZO" & J, "TargetMsg")
            End If
        End With
    Next J
    
    Set FileManager = Nothing
    
Exit Sub
 
errorH:

    If Err.number <> 0 Then
        
        If Err.number = 53 Then
            Call MsgBox("El archivo Hechizos.dat no existe. Por favor, reinstale el juego.", , "Argentum Online")
            Call CloseClient
        End If
        
    End If
    
End Sub
