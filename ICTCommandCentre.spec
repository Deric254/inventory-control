# -*- mode: python ; coding: utf-8 -*-
from PyInstaller.utils.hooks import collect_data_files

openpyxl_datas = collect_data_files('openpyxl')
try:
    reportlab_datas = collect_data_files('reportlab')
except Exception:
    reportlab_datas = []

a = Analysis(
    ['main.py'],
    pathex=['.'],
    binaries=[],
    datas=[
        ('ui.html',        '.'),
        ('ICT_MASTER.xlsx','.'),
        ('auth.json',      '.'),
    ] + openpyxl_datas + reportlab_datas,
    hiddenimports=[
        'openpyxl',
        'openpyxl.styles',
        'openpyxl.styles.fills',
        'openpyxl.styles.fonts',
        'openpyxl.styles.alignment',
        'openpyxl.utils',
        'openpyxl.utils.cell',
        'openpyxl.drawing.image',
        'openpyxl.chart',
        'openpyxl.worksheet.table',
        'reportlab',
        'reportlab.lib',
        'reportlab.lib.pagesizes',
        'reportlab.lib.styles',
        'reportlab.lib.units',
        'reportlab.lib.colors',
        'reportlab.lib.enums',
        'reportlab.platypus',
        'reportlab.platypus.tables',
        'reportlab.platypus.flowables',
        'reportlab.graphics',
        'reportlab.graphics.shapes',
        'reportlab.pdfgen',
        'reportlab.pdfbase',
        'reportlab.pdfbase.ttfonts',
        'reportlab.pdfbase.pdfmetrics',
        'email',
        'email.utils',
        'email.message',
        'html',
        'html.parser',
        'http',
        'http.server',
        'http.client',
        'urllib',
        'urllib.parse',
        'collections',
        'hashlib',
        'secrets',
        'threading',
        'io',
        'base64',
        'json',
        'datetime',
        'shutil',
        're',
    ],
    hookspath=[],
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='ICT_CommandCentre',
    debug=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    bootloader_ignore_signals=False,
    argv_emulation=False,
    target_arch=None,
)
