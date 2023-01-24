function AlignWCSwithPoint(mws)

WCS = invoke(mws,'WCS');
invoke(WCS,'AlignWCSWithSelected','Point');
end
