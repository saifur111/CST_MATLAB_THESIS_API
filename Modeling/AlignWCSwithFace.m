function AlignWCSwithFace(mws)

WCS = invoke(mws,'WCS');
invoke(WCS,'AlignWCSWithSelected','Face');
end