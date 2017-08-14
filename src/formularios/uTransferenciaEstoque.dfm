object frmTransferenciaEstoque: TfrmTransferenciaEstoque
  Left = 0
  Top = 0
  Caption = 'Transferencia de Estoque'
  ClientHeight = 603
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    740
    603)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = -11
    Top = 464
    Width = 751
    Height = 72
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 15395562
    Pen.Color = 14211288
    ExplicitWidth = 705
  end
  object Label1: TLabel
    Left = 8
    Top = 57
    Width = 367
    Height = 17
    Caption = 'Informe a refer'#234'ncia de origem da transfer'#234'ncia de estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14248960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 257
    Width = 345
    Height = 17
    Caption = 'Informe a refer'#234'ncia que receber'#225' o estoque transferido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3572032
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 90
    Top = 470
    Width = 97
    Height = 17
    Caption = 'Estoque origem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14248960
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 552
    Top = 468
    Width = 99
    Height = 17
    Caption = 'Estoque destino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3572032
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 318
    Top = 470
    Width = 92
    Height = 17
    Caption = 'Qtde. Transferir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5460819
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 243
    Top = 494
    Width = 27
    Height = 17
    Caption = '>>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5460819
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 472
    Top = 494
    Width = 27
    Height = 17
    Caption = '>>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5460819
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 473
    Top = 143
    Width = 31
    Height = 17
    Caption = 'Setor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 471
    Top = 341
    Width = 31
    Height = 17
    Caption = 'Setor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  inline BuscaProduto1: TBuscaProduto
    Left = 34
    Top = 81
    Width = 556
    Height = 52
    TabOrder = 0
    OnExit = BuscaProduto1Exit
    ExplicitLeft = 34
    ExplicitTop = 81
    ExplicitWidth = 556
    ExplicitHeight = 52
    inherited StaticText3: TStaticText
      Width = 33
      Font.Style = []
      ExplicitWidth = 33
    end
    inherited StaticText1: TStaticText
      Width = 56
      Font.Style = []
      ExplicitWidth = 56
    end
    inherited StaticText2: TStaticText
      Width = 41
      Font.Style = []
      ExplicitWidth = 41
    end
    inherited edtDescricao: TEdit
      OnChange = BuscaProduto1edtDescricaoChange
    end
  end
  inline BuscaCor1: TBuscaCor
    Left = 32
    Top = 137
    Width = 425
    Height = 46
    TabOrder = 1
    OnEnter = BuscaCor1Enter
    OnExit = BuscaCor1Exit
    ExplicitLeft = 32
    ExplicitTop = 137
    ExplicitWidth = 425
    ExplicitHeight = 46
    inherited StaticText2: TStaticText
      Width = 20
      Caption = 'Cor'
      Font.Style = []
      ExplicitWidth = 20
    end
    inherited StaticText1: TStaticText
      Width = 56
      Font.Style = []
      ExplicitWidth = 56
    end
    inherited btnBusca: TBitBtn
      Top = 22
      ExplicitTop = 22
    end
    inherited edtDescricao: TEdit
      Left = 125
      Top = 23
      Width = 295
      ExplicitLeft = 125
      ExplicitTop = 23
      ExplicitWidth = 295
    end
  end
  object rgTamanhos1: TRadioGroup
    Left = 0
    Top = 191
    Width = 740
    Height = 50
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Tamanhos '
    Columns = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    Items.Strings = (
      'PM'
      'RN'
      'P'
      'M'
      'G'
      '1'
      '2'
      '3'
      '4'
      '6'
      '8'
      '10'
      '12'
      '14'
      'UNICA')
    ParentFont = False
    TabOrder = 2
    TabStop = True
    OnClick = rgTamanhos1Click
    ExplicitWidth = 694
  end
  inline BuscaProduto2: TBuscaProduto
    Left = 34
    Top = 281
    Width = 556
    Height = 52
    TabOrder = 3
    OnExit = BuscaProduto2Exit
    ExplicitLeft = 34
    ExplicitTop = 281
    ExplicitWidth = 556
    ExplicitHeight = 52
    inherited StaticText3: TStaticText
      Width = 33
      Font.Style = []
      ExplicitWidth = 33
    end
    inherited StaticText1: TStaticText
      Width = 56
      Font.Style = []
      ExplicitWidth = 56
    end
    inherited StaticText2: TStaticText
      Width = 41
      Font.Style = []
      ExplicitWidth = 41
    end
    inherited edtDescricao: TEdit
      OnChange = BuscaProduto2edtDescricaoChange
    end
  end
  inline BuscaCor2: TBuscaCor
    Left = 34
    Top = 337
    Width = 425
    Height = 46
    TabOrder = 4
    OnEnter = BuscaCor2Enter
    OnExit = BuscaCor2Exit
    ExplicitLeft = 34
    ExplicitTop = 337
    ExplicitWidth = 425
    ExplicitHeight = 46
    inherited StaticText2: TStaticText
      Width = 20
      Caption = 'Cor'
      Font.Style = []
      ExplicitWidth = 20
    end
    inherited StaticText1: TStaticText
      Width = 56
      Font.Style = []
      ExplicitWidth = 56
    end
    inherited btnBusca: TBitBtn
      Top = 22
      ExplicitTop = 22
    end
  end
  object rgTamanhos2: TRadioGroup
    Left = 0
    Top = 394
    Width = 740
    Height = 50
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Tamanhos '
    Columns = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    Items.Strings = (
      'RN'
      'P'
      'M'
      'G'
      '1'
      '2'
      '3'
      '4'
      '6'
      '8'
      '10'
      '12'
      '14'
      'UNICA')
    ParentFont = False
    TabOrder = 5
    TabStop = True
    OnClick = rgTamanhos2Click
    ExplicitWidth = 694
  end
  object edtEstoqueDestino: TCurrencyEdit
    Left = 552
    Top = 491
    Width = 109
    Height = 26
    AutoSize = False
    Ctl3D = False
    DisplayFormat = ',0.00;-,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
  end
  object edtEstoqueOrigem: TCurrencyEdit
    Left = 90
    Top = 491
    Width = 109
    Height = 26
    AutoSize = False
    Ctl3D = False
    DisplayFormat = ',0.00;-,0.00'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object edtQtdTransferir: TCurrencyEdit
    Left = 319
    Top = 491
    Width = 109
    Height = 26
    AutoSize = False
    Ctl3D = False
    DisplayFormat = ',0.00;-,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 8
    OnChange = edtQtdTransferirChange
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 552
    Width = 740
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 9
    ExplicitWidth = 694
    object btnSalvar: TBitBtn
      Left = 567
      Top = 8
      Width = 140
      Height = 33
      Caption = ' Salvar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000C1761B00C275
        1900BD6B1300B9650400B9650400B9650400BA650400BA650400BA650400BA65
        0400BA650400BA650400BA650400BC690A00B96A1500C3791F005D1200005E11
        0000590700005501000055010000550100005601000056010000560100005601
        000056010000560100005601000058050000550600005F150000D5933D00EFB7
        3600CDC6C000E9F8FF00DBE5F600DBE8F800DBE8F800DBE8F900DBE8F800DAE7
        F800DBE7F800D8E4F500E9F6FF00CDC6C000EAA71400C0761D00712F00008B53
        000069625C0085949B0077819200778494007784940077849500778494007683
        9400778394007480910085929B0069625C00864300005C120000CD955100E8AE
        3C00DCD7D400ECE8E900ADA0A200A79B9E009E93950094898C008A8185008379
        7C007B727600685F6400ECE8E900DCD7D400E59E2000C77B250069310000844A
        00007873700088848500493C3E0043373A003A2F310030252800261D21001F15
        1800170E1200040000008884850078737000813A000063170000D0965300EAB4
        4700DCD7D400EFF0EF00DFDEDC00E1E0DF00E0DFDE00DFE0DD00E0DFDD00DFDE
        DD00DFE0DE00DBD9D900EDEDED00DCD7D400E7A62B00C9802B006C3200008650
        0000787370008B8C8B007B7A78007D7C7B007C7B7A007B7C79007C7B79007B7A
        79007B7C7A0077757500898989007873700083420000651C0000D49B5800EBB9
        5000DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
        7C007A717700655C6200ECE8E900DCD7D400E8AC3700CC853100703700008755
        0000787370008884850045393B0040353A00362D30002E242700251B21001E15
        1800160D13000100000088848500787370008448000068210000D69E5B00EDBD
        5A00DCD7D400FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EAB34000D08B3400723A00008959
        0000787370009B9B9B009B9A9A009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B0078737000864F00006C270000D9A45E00F0C2
        6300DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
        7C007A717700655C6200ECE8E900DCD7D400EDB74900D2903A00754000008C5E
        0000787370008884850045393B0040353A00362D30002E242700251B21001E15
        1800160D1300010000008884850078737000895300006E2C0000D8A35C00F0C6
        6D00DCD7D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EEBD5400D7963E00743F00008C62
        0900787370009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00787370008A59000073320000DEAC6900F9D2
        8100C1975C009A7B600095775E0097795D0097795D0097795D0097795D009779
        5C0097795C0095775E009A7A5E00C19A6400F7CA6B00D99B44007A480500956E
        1D005D3300003617000031130000331500003315000033150000331500003315
        00003315000031130000361600005D3600009366070075370000DDAB6700F6D5
        8B00FFD05600C0A88700C8C5C900CEC6BF00CDC6C000CDC6C000CDC6BF00D6D0
        CA00D6D3D000CFCED400C0A88800FFD25D00F3CC7500DCA14800794703009271
        27009B6C00005C442300646165006A625B0069625C0069625C0069625B00726C
        6600726F6C006B6A70005C4424009B6E00008F681100783D0000DCA96600F6D9
        9300FBC85D00C2B4A200D7DEEB00DDDDDD00DCDDDE00DCDBDD00E7E8EA00C8BA
        A700A2969200C2B4A200C6BCA900FBCB6300F3D07E00E0A74C00784502009275
        2F00976400005E503E00737A87007979790078797A0078777900838486006456
        43003E322E005E503E0062584500976700008F6C1A007C430000E5B97300F6DA
        9700FBCC6200C8BAA700DDE0E900E1DFDD00E0DFDE00DFDDDC00EFF3F9009F88
        6F00E5AF47009E918900C7BDB200FDCF6A00F5D48400E3AC510081550F009276
        33009768000064564300797C85007D7B79007C7B7A007B7978008B8F95003B24
        0B00814B00003A2D250063594E00996B0600917020007F480000E9BC7500F8DD
        9E00FDCF6900CEC0AF00E3E7EF00E7E5E300E6E5E400E5E4E200F1F6FF00BAA3
        8600FFE87300B5AB9E00CAC0B800FFD26E00F9DA8E00E7B25B00855811009479
        3A00996B05006A5C4B007F838B0083817F008281800081807E008D929B00563F
        22009B840F0051473A00665C54009B6E0A0095762A00834E0000EAC07900F8E0
        9B00FBD16500D3C4AF00EAEEF600ECEBE800ECEBE900EBE9E600FBFFFF00A28E
        7800DEAF4F00A89C9500D1C7B900FFDA7800F5D88900E2A44200865C1500947C
        3700976D01006F604B00868A9200888784008887850087858200979B9B003E2A
        14007A4B0000443831006D6355009B761400917425007E400000ECC47E00FEF4
        D500FFE29000DCD7D400F5FFFF00F6FEFF00F6FEFF00F6FDFF00FFFFFF00DFDD
        DC00C8BAA700DFDDDC00E5E4E200FFDE8800E4AA4500FCF5EC0088601A009A90
        71009B7E2C0078737000919B9B00929A9B00929A9B0092999B009B9B9B007B79
        7800645643007B79780081807E009B7A24008046000098918800ECC68100F0CA
        8200F4CA7D00E8C78800EFCF9400EFD49800EDCF9200EED09200EED09300F2D3
        9600F7D79B00F6D69B00E6C48A00EBB55200FDF9F200FFFFFF0088621D008C66
        1E0090661900846324008B6B30008B703400896B2E008A6C2E008A6C2F008E6F
        32009373370092723700826026008751000099958E009B9B9B00}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnLimpar: TBitBtn
      Left = 400
      Top = 8
      Width = 140
      Height = 33
      Caption = ' Limpar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00825B1E00A38352009E7D48009E7D49009E7D49009E7D49009E7D49009E7D
        49009E7D49009E7D49009E7C4B00997544008D673300FFFFFF009B9B9B009B9B
        9B001E0000003F1F00003A1900003A1900003A1900003A1900003A1900003A19
        00003A1900003A1900003A18000035110000290300009B9B9B00FFFFFF00FFFF
        FF00A0805200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099774500FFFFFF009B9B9B009B9B
        9B003C1C00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00351300009B9B9B00FFFFFF00FFFF
        FF00A6855600FFFFFF00F5F4EC00F3F1E800F3F1E900F3F1E900F2F0E700EFE8
        DE00EEE9E000EFEBE200F6F3ED00F0EBE20099723800FFFFFF009B9B9B009B9B
        9B00422100009B9B9B00919088008F8D84008F8D85008F8D85008E8C83008B84
        7A008A857C008B877E00928F89008C877E00350E00009B9B9B00FFFFFF00FFFF
        FF00AD916400FFFFFF00F6F4EF00F5F2EF00F5F2EF00F5F2EF00F5F2EF00F6F5
        ED00F3F4E800F3F0EA00FCFCF900EFE9E00099733A00FFFFFF009B9B9B009B9B
        9B00492D00009B9B9B0092908B00918E8B00918E8B00918E8B00918E8B009291
        89008F9084008F8C8600989895008B857C00350F00009B9B9B00FFFFFF00FFFF
        FF00B3966900FFFFFF00F6F4EF00F5F2ED00F5F2ED00F5F2ED00F5F3EE00F5F2
        EE00F7F3EF00F5F2ED00FDFDFA00EFE8E00099733A00FFFFFF009B9B9B009B9B
        9B004F3205009B9B9B0092908B00918E8900918E8900918E8900918F8A00918E
        8A00938F8B00918E8900999996008B847C00350F00009B9B9B00FFFFFF00FFFF
        FF00B1966700FFFFFF00F6F4EF00F5F2ED00F5F2ED00F5F2ED00F7F6EF00F6F1
        EE00FCF6F400FAF3F200FEFBFD00EFE9DF0099733900FFFFFF009B9B9B009B9B
        9B004D3203009B9B9B0092908B00918E8900918E8900918E890093928B00928D
        8A0098929000968F8E009A9799008B857B00350F00009B9B9B00FFFFFF00FFFF
        FF00B1966600FFFFFF00F6F4EF00F5F2ED00F4F1EC00F4F0EC00F9F3F200FBFA
        F000FBF9F500FBF4F300FCF7F300EFEAE30099733B00FFFFFF009B9B9B009B9B
        9B004D3202009B9B9B0092908B00918E8900908D8800908C8800958F8E009796
        8C009795910097908F0098938F008B867F00350F00009B9B9B00FFFFFF00FFFF
        FF00B0956D00FFFFFF00F7F4ED00F4F1EC00F6F2ED00F9F2F200FAFAF400FBFD
        F600FCFAF900F4EFE700F5F1EC00F0EAE2009A743C00FFFFFF009B9B9B009B9B
        9B004C3109009B9B9B0093908900908D8800928E8900958E8E00969690009799
        920098969500908B8300918D88008C867E00361000009B9B9B00FFFFFF00FFFF
        FF00B19E7C00FFFFFF00FCFEF800F9F9F000FBFAF900FAF9FC00FBFCFB00FAFA
        FC00F3F1E900EAE5DD00ECE7E000E6D8CB009A763C00FFFFFF009B9B9B009B9B
        9B004D3A18009B9B9B00989A940095958C009796950096959800979897009696
        98008F8D85008681790088837C0082746700361200009B9B9B00FFFFFF00FFFF
        FF00BDA78700FFFFFF00FDFEFC00FAFBF800FAFAFC00FAFBFE00FCFBF900F5F2
        EA00F0EEE700E9E2DA00E6DDD400D6CBB4009B773E00FFFFFF009B9B9B009B9B
        9B00594323009B9B9B00999A9800969794009696980096979A0098979500918E
        86008C8A8300857E76008279700072675000371300009B9B9B00FFFFFF00FFFF
        FF00C5B19000FFFFFF00FCFDFD00FAF9F900FAFBFD00FBFDFA00F9F7F000F3EE
        E400DDD4C500D4BEAB00D0BCA100BEA784009B783F00FFFFFF009B9B9B009B9B
        9B00614D2C009B9B9B009899990096959500969799009799960095938C008F8A
        800079706100705A47006C583D005A432000371400009B9B9B00FFFFFF00FFFF
        FF00C7B59600FFFFFF00F8FDFD00FAFBFB00FBFDFA00F6F7EB00F3F1E900E3D9
        CA00C9B49300EBE3DC00E1D9C600B79D73009D773F00FFFFFF009B9B9B009B9B
        9B00635132009B9B9B00949999009697970097999600929387008F8D85007F75
        660065502F00877F78007D75620053390F00391300009B9B9B00FFFFFF00FFFF
        FF00C8B59900FFFFFF00FBFDFF00FDFDFD00F6F7F200EDE7E000EFE4DD00D1BE
        A600CDB99A00FFFFFF00CFBBA100B3966A00FAF8F500FFFFFF009B9B9B009B9B
        9B00645135009B9B9B0097999B009999990092938E0089837C008B8079006D5A
        4200695536009B9B9B006B573D004F320600969491009B9B9B00FFFFFF00FFFF
        FF00C9B89B00FFFFFF00FCFFFF00FCF8F300F4EBE500E5DFD700E3D6C600CDB6
        9600BCAA8900D6C8B400AA8A5700FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B00655437009B9B9B00989B9B0098948F0090878100817B73007F7262006952
        32005846250072645000462600009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00CBBDA200FFFFFF00FFFFFF00FAF7F600F0E8DF00DFD7C700D8C6B100C1AA
        85009F824C00B2966A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B0067593E009B9B9B009B9B9B00969392008C847B007B73630074624D005D46
        21003B1E00004E3206009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C4B39300CFBDA400CDBCA100C9B79B00C8B69A00C5AF8D00C3AB8500AA91
        6100AA8C5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B00604F2F006B59400069583D006553370064523600614B29005F472100462D
        0000462800009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnLimparClick
    end
  end
  object edtCodEstoque1: TCurrencyEdit
    Left = 8
    Top = 507
    Width = 48
    Height = 21
    AutoSize = False
    DisplayFormat = '0'
    TabOrder = 10
    Visible = False
  end
  object edtCodEstoque2: TCurrencyEdit
    Left = 471
    Top = 523
    Width = 48
    Height = 21
    AutoSize = False
    DisplayFormat = '0'
    TabOrder = 11
    Visible = False
  end
  object cbxSetorOrigem: TComboBox
    Left = 472
    Top = 162
    Width = 118
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemIndex = 0
    TabOrder = 12
    Text = 'F'#225'brica'
    Items.Strings = (
      'F'#225'brica'
      'E-Commerce')
  end
  object cbxSetorDestino: TComboBox
    Left = 470
    Top = 360
    Width = 118
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemIndex = 0
    TabOrder = 13
    Text = 'F'#225'brica'
    Items.Strings = (
      'F'#225'brica'
      'E-Commerce')
  end
  object rgpOpcaoTransferencia: TRadioGroup
    Left = 8
    Top = 1
    Width = 724
    Height = 48
    Caption = ' Op'#231#245'es de transfer'#234'ncia '
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'F'#225'brica para F'#225'brica'
      'F'#225'brica para E-Commerce'
      'E-Commerce para F'#225'brica')
    ParentFont = False
    TabOrder = 14
    OnClick = rgpOpcaoTransferenciaClick
  end
end
