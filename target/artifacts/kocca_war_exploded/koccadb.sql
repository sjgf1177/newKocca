if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_codenm]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[get_codenm]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_compnm]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[get_compnm]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_jikunnm]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[get_jikunnm]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_jikwinm]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[get_jikwinm]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LPAD]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[LPAD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_deptnm]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[get_deptnm]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_jikupnm]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[get_jikupnm]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_name]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[get_name]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[instr]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[instr]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nvl]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[nvl]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[to_char]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[to_char]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[to_date]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[to_date]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[to_number]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[to_number]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[to_number2]') and xtype in (N'FN', N'IF', N'TF'))਍ഀ
drop function [dbo].[to_number2]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[p_chp_prg]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)਍ഀ
drop procedure [dbo].[p_chp_prg]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[p_student]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)਍ഀ
drop procedure [dbo].[p_student]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_lock2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)਍ഀ
drop procedure [dbo].[sp_lock2]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_lock3]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)਍ഀ
drop procedure [dbo].[sp_lock3]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VZ_MEMBER]') and OBJECTPROPERTY(id, N'IsView') = 1)਍ഀ
drop view [dbo].[VZ_MEMBER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VZ_SCSUBJSEQ]') and OBJECTPROPERTY(id, N'IsView') = 1)਍ഀ
drop view [dbo].[VZ_SCSUBJSEQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VZ_STUDENT]') and OBJECTPROPERTY(id, N'IsView') = 1)਍ഀ
drop view [dbo].[VZ_STUDENT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VZ_SUBJCOURSESEQ]') and OBJECTPROPERTY(id, N'IsView') = 1)਍ഀ
drop view [dbo].[VZ_SUBJCOURSESEQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CHP_PRG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[CHP_PRG]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EXM_BNK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[EXM_BNK]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EXM_MST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[EXM_MST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EXM_QUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[EXM_QUE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LEC_MST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[LEC_MST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LEC_REQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[LEC_REQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LEC_REQ_2002]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[LEC_REQ_2002]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LEC_REQ_KOCCA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[LEC_REQ_KOCCA]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LEC_SCL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[LEC_SCL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RPT_RST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[RPT_RST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TY_COMMON_ACT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TY_COMMON_ACT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ADMINMENUAUTH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ADMINMENUAUTH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ANNOT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ANNOT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ASPORANK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ASPORANK]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BDS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BDS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETACPINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETACPINFO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETAMFSUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETAMFSUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETAPREVIEWOBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETAPREVIEWOBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETAPROGRESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETAPROGRESS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETASCOSUBJOBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETASCOSUBJOBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETASUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETASUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETASUBJLESSON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETASUBJLESSON]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETASUBJMODULE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETASUBJMODULE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETASUBJOBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETASUBJOBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BETATESTHISTORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BETATESTHISTORY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BILLING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BILLING]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BLACKCONDITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BLACKCONDITION]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BLACKLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BLACKLIST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BOARD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BOARD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BOARDFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BOARDFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BOOK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BOOK]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BOOKSELL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BOOKSELL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BUDGET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BUDGET]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BULLETIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BULLETIN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_BULLETINFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_BULLETINFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CANCEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CANCEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CLASS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CLASS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CLASSFYMATCH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CLASSFYMATCH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CLASSIF]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CLASSIF]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CLASSTUTOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CLASSTUTOR]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUALBUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUALBUM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUALBUMREPLY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUALBUMREPLY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUALDIRECT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUALDIRECT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUALDIRECTFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUALDIRECTFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUALDIRECTREPLAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUALDIRECTREPLAY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUBASEMST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUBASEMST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUBOARD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUBOARD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUBOARDFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUBOARDFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUBOARDREPLAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUBOARDREPLAY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUCALENDAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUCALENDAR]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUDIRECT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUDIRECT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUDIRECTFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUDIRECTFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUDIRECTREPLAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUDIRECTREPLAY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUFAQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUFAQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUFAQFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUFAQFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUFAQREPLAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUFAQREPLAY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUGRDCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUGRDCODE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUHONGBO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUHONGBO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUMAIL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUMAIL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUMENU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUMENU]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUMENULIMIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUMENULIMIT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUPOLICE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUPOLICE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUPOLLFIELD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUPOLLFIELD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUPOLLMST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUPOLLMST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUPOLLQUEST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUPOLLQUEST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUPOLLTICKET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUPOLLTICKET]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CMUUSERMST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CMUUSERMST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CODE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CODEGUBUN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CODEGUBUN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COMMENTQNA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COMMENTQNA]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COMMUNITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COMMUNITY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COMMUNITY_NOTICE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COMMUNITY_NOTICE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COMP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COMPCLASS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COMPCLASS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COMPCONDITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COMPCONDITION]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COMPMAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COMPMAN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONFIG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONFIG]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONLEARNMARK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONLEARNMARK]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONNICK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONNICK]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONQUIZ_OX]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONQUIZ_OX]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONSEXUAL_TABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONSEXUAL_TABLE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTACT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTACT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTBCHAPTER1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTBCHAPTER1]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTBCHAPTER2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTBCHAPTER2]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTBCHAPTER3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTBCHAPTER3]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTBCHAPTER4]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTBCHAPTER4]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTBLANSWER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTBLANSWER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTBLNETRO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTBLNETRO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTCHAPTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTCHAPTER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CONTCLAUSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CONTCLAUSE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COPREP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COPREP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CORRECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CORRECTION]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COURSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COURSE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COURSEMAP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COURSEMAP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COURSESEQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COURSESEQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COURSESTOLD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COURSESTOLD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COURSESUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COURSESUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_COURSE_CHILDREN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_COURSE_CHILDREN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CPEXCELTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CPEXCELTEMP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CPINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CPINFO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CPPARAM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CPPARAM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_CPUPDATESTATUS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_CPUPDATESTATUS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNEACH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNEACH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNMAIL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNMAIL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNMAILING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNMAILING]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNMEMBER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNMEMBER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNOBEACH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNOBEACH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNOBMAIL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNOBMAIL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNOBSERVER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNOBSERVER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNPAPER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNPAPER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DAMUNSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DAMUNSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DATABOARD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DATABOARD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DEPTM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DEPTM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DIAGNOSTIC_INFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DIAGNOSTIC_INFO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DIC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DIC]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DICGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DICGROUP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_DISCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_DISCOUNT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EDUTARGET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EDUTARGET]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EDU_LAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EDU_LAN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EDU_ROL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EDU_ROL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ERROR_INFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ERROR_INFO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ETEST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ETEST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ETESTMASTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ETESTMASTER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ETESTMEMBER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ETESTMEMBER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ETESTPAPER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ETESTPAPER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ETESTRESULT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ETESTRESULT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ETESTSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ETESTSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ETESTSUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ETESTSUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EXAM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EXAM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EXAMMASTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EXAMMASTER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EXAMPAPER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EXAMPAPER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EXAMRESULT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EXAMRESULT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EXAMRESULTTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EXAMRESULTTEMP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_EXAMSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_EXAMSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_FAQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_FAQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_FAQ_CATEGORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_FAQ_CATEGORY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GADMIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GADMIN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GEN_CAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GEN_CAT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GEN_COV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GEN_COV]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GEN_DES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GEN_DES]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GEN_KEY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GEN_KEY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GEN_LAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GEN_LAN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GONG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GONG]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GONGSAMPLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GONGSAMPLE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GRCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GRCODE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GRCODEMAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GRCODEMAN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GRCOMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GRCOMP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GRRECOM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GRRECOM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GRSEQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GRSEQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_GRSUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_GRSUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_HOMECOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_HOMECOUNT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_HOMEFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_HOMEFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_HOMEMENU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_HOMEMENU]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_HOMEMENU_MASTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_HOMEMENU_MASTER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_HOMEQNA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_HOMEQNA]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_HUMANTOUCH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_HUMANTOUCH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_INTERACTIONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_INTERACTIONS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_INTEREST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_INTEREST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_INTER_COR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_INTER_COR]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_INTER_OBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_INTER_OBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_JIKMU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_JIKMU]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_JIKUN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_JIKUN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_JIKUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_JIKUP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_JIKWI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_JIKWI]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_JINDAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_JINDAN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_JINDANRESULT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_JINDANRESULT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_JINDANSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_JINDANSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_KNOWCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_KNOWCODE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LANGUAGE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LANGUAGE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LETTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LETTER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMAPP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMAPP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMAPP_IMSI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMAPP_IMSI]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMASSIGN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMASSIGN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMASSIGN_IMSI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMASSIGN_IMSI]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMHST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMHST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMHST_IMSI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMHST_IMSI]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMINFO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMINFO_IMSI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMINFO_IMSI]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LEXAMSITE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LEXAMSITE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LIF_CEN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LIF_CEN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LIF_CON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LIF_CON]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_LINKSITE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_LINKSITE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MANAGER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MANAGER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MASTERCD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MASTERCD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MASTERSUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MASTERSUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MEMBER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MEMBER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MEMBERTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MEMBERTEMP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MEMBER_MILEAGE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MEMBER_MILEAGE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MENU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MENU]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MENUAUTH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MENUAUTH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MENUCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MENUCOUNT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MENUSUB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MENUSUB]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MENUSUBPROCESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MENUSUBPROCESS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MET_CAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MET_CAT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MET_CEN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MET_CEN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MET_CON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MET_CON]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MET_M]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MET_M]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MET_SCH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MET_SCH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MFMENU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MFMENU]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_MFSUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_MFSUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_NOTICE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_NOTICE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_NOTICE_TEMPLET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_NOTICE_TEMPLET]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OBJATT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OBJATT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OBJECT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OBJECT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OBJECTIVES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OBJECTIVES]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OFFGALLERY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OFFGALLERY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OFFLINEPROPOSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OFFLINEPROPOSE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OFFLINESUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OFFLINESUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OFFSUBJLECTURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OFFSUBJLECTURE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OPENFORUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OPENFORUM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OPENFORUMCOMMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OPENFORUMCOMMENT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OPENFORUMSUBJECT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OPENFORUMSUBJECT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OUTCOMPMAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OUTCOMPMAN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_OUTMEMBER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_OUTMEMBER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_POINTITEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_POINTITEM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_POLL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_POLL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_POLLLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_POLLLOG]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_POLLSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_POLLSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_POSTSCRIPT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_POSTSCRIPT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PRECOURSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PRECOURSE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PREVIEW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PREVIEW]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PREVIEWOBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PREVIEWOBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PREVIEW_LOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PREVIEW_LOG]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PROGRESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PROGRESS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PROJASSIGN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PROJASSIGN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PROJGRP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PROJGRP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PROJORD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PROJORD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PROJREP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PROJREP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PROJREPHALF]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PROJREPHALF]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_PROPOSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_PROPOSE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_QNA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_QNA]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_QNAFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_QNAFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_RELAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_RELAT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SANGDAM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SANGDAM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SCALE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SCALE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SCALESEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SCALESEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SCOLOCATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SCOLOCATE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SCOSUBJOBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SCOSUBJOBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SESSIONINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SESSIONINFO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOCODE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SODIAGNOS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SODIAGNOS]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SODIAGNOSPAPER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SODIAGNOSPAPER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SODIAGNOSSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SODIAGNOSSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOEVENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOEVENT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOEXAM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOEXAM]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOEXAMPAPER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOEXAMPAPER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOEXAMSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOEXAMSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOSUL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOSUL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOSULPAPER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOSULPAPER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SOSULSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SOSULSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SRCHMEMBERLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SRCHMEMBERLOG]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STOLD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STOLD]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STOLDHST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STOLDHST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STUDENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STUDENT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STUDENTREJECT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STUDENTREJECT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STUDENT_PRE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STUDENT_PRE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STUDYCONTROL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STUDYCONTROL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STUDYCONTROLEXP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STUDYCONTROLEXP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_STUDYCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_STUDYCOUNT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJATT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJATT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJBULLETIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJBULLETIN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJBULLETINFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJBULLETINFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJCOUNT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJECTDOCFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJECTDOCFILE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJLESSON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJLESSON]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJLESSONDATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJLESSONDATE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJLOGINID]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJLOGINID]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJMAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJMAN]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJMODULE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJMODULE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJOBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJOBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJRELATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJRELATE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJSEQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJSEQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUBJSEQTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUBJSEQTEMP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULDISTRIB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULDISTRIB]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULEACH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULEACH]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULMAIL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULMAIL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULMAILING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULMAILING]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULMEMBER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULMEMBER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULPAPER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULPAPER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULPAPERCP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULPAPERCP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULRESULTP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULRESULTP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SULSEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SULSEL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_SUPERIORITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_SUPERIORITY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TAX]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TAX]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TBUDGET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TBUDGET]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TCOMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TCOMP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TEC_REQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TEC_REQ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TEMPLET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TEMPLET]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TEMPLET_MASTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TEMPLET_MASTER]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TLESSON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TLESSON]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TLESSONHST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TLESSONHST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TORON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TORON]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TORONTP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TORONTP]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TSUBJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TSUBJ]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TUTOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TUTOR]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TUTORGRADE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TUTORGRADE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TUTORLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TUTORLOG]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TUTORMEASURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TUTORMEASURE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TUTORMESSAGE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TUTORMESSAGE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_TUTORPAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_TUTORPAY]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_USERMAIL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_USERMAIL]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_USER_SCOINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_USER_SCOINFO]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_WORKPLC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_WORKPLC]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TZ_ZIPCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[TZ_ZIPCODE]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[USR_DLT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[USR_DLT]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[USR_MST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[USR_MST]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbContentData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[tbContentData]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbSearchData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[tbSearchData]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tz_basket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[tz_basket]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tz_basketbill]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[tz_basketbill]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tz_billcancel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[tz_billcancel]਍ഀ
GO਍ഀ
਍ഀ
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tz_billinfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)਍ഀ
drop table [dbo].[tz_billinfo]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[CHP_PRG] (਍ഀ
	[LECCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CHPCODE] [int] NOT NULL ,਍ഀ
	[USRCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PRGFLAG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PRGSDAT] [datetime] NULL ,਍ഀ
	[PRGEDAT] [datetime] NULL ,਍ഀ
	[PRGCONT] [int] NULL ,਍ഀ
	[PRGTIME] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[EXM_BNK] (਍ഀ
	[SJTCODE] [varchar] (6) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[QUENUMB] [int] NOT NULL ,਍ഀ
	[QUETYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[QUELEVE] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[QUECHAR] [char] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[QUETITL] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[QUEIMAG] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEMPEG] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW1] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW2] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW3] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG3] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW4] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG4] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW5] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG5] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW6] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG6] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW7] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG7] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW8] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG8] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW9] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG9] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW10] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG10] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEANSW] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEDESC] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUESCRE] [int] NOT NULL ,਍ഀ
	[QUEIMG11] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUETEXT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG0] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[EXM_MST] (਍ഀ
	[LECCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXMNUMB] [int] NOT NULL ,਍ഀ
	[EXMTITL] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXMDESC] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXMTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXMPLAN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXMSTDT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXMSTHH] [int] NULL ,਍ഀ
	[EXMSTMM] [int] NULL ,਍ഀ
	[EXMENDT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXMENHH] [int] NULL ,਍ഀ
	[EXMENMM] [int] NULL ,਍ഀ
	[EXMTIME] [int] NULL ,਍ഀ
	[EXMFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXMASIT] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PRFCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXMDATE] [datetime] NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ,਍ഀ
	[SUBJ] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[EXM_QUE] (਍ഀ
	[LECCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXMNUMB] [int] NOT NULL ,਍ഀ
	[QUENUMB] [int] NOT NULL ,਍ഀ
	[QUETYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[QUETITL] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMAG] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEMPEG] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW1] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW2] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW3] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG3] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW4] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG4] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEVIW5] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG5] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEANSW] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEDESC] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUESCRE] [int] NULL ,਍ഀ
	[QUETEXT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEIMG0] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[LEC_MST] (਍ഀ
	[LECCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PRGCODE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRPCODE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CRSCODE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SJTCODE] [varchar] (6) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECTERM] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FINCODE] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECQUOT] [int] NULL ,਍ഀ
	[ISPRETEST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECTIME] [int] NULL ,਍ഀ
	[ADMCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECTTTR] [int] NULL ,਍ഀ
	[LECWTFG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECVWCN] [int] NULL ,਍ഀ
	[LECRDAT] [datetime] NULL ,਍ഀ
	[LECFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISINSURANCE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECKNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECKCODE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECPOINT] [int] NULL ,਍ഀ
	[LECRATO] [smallint] NULL ,਍ഀ
	[LECPRAC] [smallint] NULL ,਍ഀ
	[LECRATE] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECOBJT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECUSER] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECBOOK] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECSPEC] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECETCS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECMETH] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECPSRC] [int] NULL ,਍ഀ
	[LECSTAT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CKSOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[KPSOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECFLAG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECPROD] [int] NULL ,਍ഀ
	[LECPRCF] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ,਍ഀ
	[IS_ANY] [varchar] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[LEC_REQ] (਍ഀ
	[USRCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECCODE] [varchar] (17) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DCSNUM] [int] NULL ,਍ഀ
	[PDCSNUM] [int] NULL ,਍ഀ
	[LECNUMB] [numeric](2, 0) NOT NULL ,਍ഀ
	[CMPCODE] [varchar] (9) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CMPISTAT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQISSEL] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQISLCT] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQISPSFLG] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQISRESTDY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQISRESCHOOL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQREGDAT] [datetime] NULL ,਍ഀ
	[REQSELDAT] [datetime] NULL ,਍ഀ
	[REQSELOKDT] [datetime] NULL ,਍ഀ
	[REQLCTDAT] [datetime] NULL ,਍ഀ
	[REQLCTOKDT] [datetime] NULL ,਍ഀ
	[LECENDDT] [datetime] NULL ,਍ഀ
	[CKGRADDT] [datetime] NULL ,਍ഀ
	[REQKIND] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQSTAT] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MAILFLAG] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CKISGRAD] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TOTSCRE] [int] NULL ,਍ഀ
	[TOTGRAD] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DCNDESC1] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DCNRATE1] [int] NULL ,਍ഀ
	[DCNDESC2] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DCNRATE2] [int] NULL ,਍ഀ
	[OPTFLAG1] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OPTFLAG2] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OPTFLAG3] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHGFLAG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DIVISION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[LEC_REQ_2002] (਍ഀ
	[STDCODE] [varchar] (13) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECCODE] [char] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECNUMB] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SJTNAME] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SJTENAM] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQRSLT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQSCRE] [numeric](5, 2) NULL ,਍ഀ
	[REQGRAD] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[LEC_REQ_KOCCA] (਍ഀ
	[USRCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DCSNUM] [int] NULL ,਍ഀ
	[PDCSNUM] [int] NULL ,਍ഀ
	[LECNUMB] [numeric](2, 0) NOT NULL ,਍ഀ
	[CMPCODE] [varchar] (9) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CMPISTAT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQISSEL] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQISLCT] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQISPSFLG] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQISRESTDY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQISRESCHOOL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQREGDAT] [datetime] NULL ,਍ഀ
	[REQSELDAT] [datetime] NULL ,਍ഀ
	[REQSELOKDT] [datetime] NULL ,਍ഀ
	[REQLCTDAT] [datetime] NULL ,਍ഀ
	[REQLCTOKDT] [datetime] NULL ,਍ഀ
	[LECENDDT] [datetime] NULL ,਍ഀ
	[CKGRADDT] [datetime] NULL ,਍ഀ
	[REQKIND] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQSTAT] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MAILFLAG] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CKISGRAD] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TOTSCRE] [int] NULL ,਍ഀ
	[TOTGRAD] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DCNDESC1] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DCNRATE1] [int] NULL ,਍ഀ
	[DCNDESC2] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DCNRATE2] [int] NULL ,਍ഀ
	[OPTFLAG1] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OPTFLAG2] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OPTFLAG3] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHGFLAG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[LEC_SCL] (਍ഀ
	[LECCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TERMNAME] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPSDAT] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPEDAT] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDSDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDEDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXTSDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXTEDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNGSDAT1] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNGEDAT1] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNGSDAT2] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNGEDAT2] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CANCSDAT1] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CANCEDAT1] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CANCSDAT2] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CANCEDAT2] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAYPRESDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAYPREEDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PRESDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PREEDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAYSDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAYEDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECSDAT] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECEDAT] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCRSDAT1] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCREDAT1] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORSDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COREDAT] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCRSDAT2] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCREDAT2] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[RPT_RST] (਍ഀ
	[LECCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RPTNUMB] [int] NOT NULL ,਍ഀ
	[USRCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RSTTITL] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSTDESC] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSTFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSTFEED] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSTFDAT] [datetime] NULL ,਍ഀ
	[RSTFFLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSTSCRE] [int] NULL ,਍ഀ
	[RSTSCDT] [datetime] NULL ,਍ഀ
	[PRFCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSTDATE] [datetime] NULL ,਍ഀ
	[RSTCONT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSTFLAG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TY_COMMON_ACT] (਍ഀ
	[SUBJ] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATES] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[SUBSEQ] [int] NOT NULL ,਍ഀ
	[GUBUN] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RESNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INPUT01] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INPUT02] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LRESNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ADMINMENUAUTH] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [char] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUSUBSEQ] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONTROL] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ANNOT] (਍ഀ
	[ANNOTATION_IDX] [int] NOT NULL ,਍ഀ
	[PERSON] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ANNOTATION_DATE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DESCRIPTION] [varchar] (3000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ASPORANK] (਍ഀ
	[GRPCOMP] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ASPO_RANK] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ASPO_RANKNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BDS] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[TYPE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STATUS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETACPINFO] (਍ഀ
	[BETASEQ] [varchar] (5) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BETACPNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BETACPNM] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HOMESITE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDRESS] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMAIL] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETAMFSUBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PGM] [varchar] (80) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM3] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM4] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM5] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERS] [int] NULL ,਍ഀ
	[PGMTYPE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETAPREVIEWOBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OIDNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERING] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETAPROGRESS] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PARAMETERSTRING] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSONSTATUS] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PREREQUISITES] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXIT] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENTRY] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MASTERYSCORE] [int] NULL ,਍ഀ
	[SEQUENCE] [int] NULL ,਍ഀ
	[TYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CREDIT] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SESSION_TIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOTAL_TIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSON_MODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE_RAW] [int] NULL ,਍ഀ
	[FIRST_EDU] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FIRST_END] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSON_COUNT] [int] NULL ,਍ഀ
	[LESSONSTATUSBEST] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETASCOSUBJOBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TYPE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDERING] [int] NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETASUBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CUSERNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFTYPE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISMFMENUIMG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFORDER] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFDLIST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFSTART] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFNMTYPE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFGRDATE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OTBGCOLOR] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCENTERED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUDAYS] [int] NULL ,਍ഀ
	[COMPANY] [varchar] (18) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPANYNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CRDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DIR] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VODURL] [varchar] (150) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PREURL] [varchar] (150) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FRAMECNT] [int] NULL ,਍ഀ
	[EDULIMIT] [int] NULL ,਍ഀ
	[WIDTH] [int] NULL ,਍ഀ
	[HEIGHT] [int] NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUPROCESS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FIRSTRESULT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FINALRESULT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETASUBJLESSON] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OWNER] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTING] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISBRANCH] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETASUBJMODULE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETASUBJOBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TYPE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDERING] [int] NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTSFROMLMS] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BETATESTHISTORY] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MASTER] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTS] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BILLING] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PAYTYPE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJPRICE] [int] NULL ,਍ഀ
	[BOOKPRICE] [int] NULL ,਍ഀ
	[BOOKYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEPOINT] [int] NULL ,਍ഀ
	[DISCOUNTRATE] [int] NULL ,਍ഀ
	[PAYMONEY] [int] NULL ,਍ഀ
	[REALPAYMONEY] [int] NULL ,਍ഀ
	[CARDNO] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CARDYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CARDAPPROVALNO] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ACCOUNTNAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAYDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAYSTAT] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFUNDSTAT] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFUNDREGDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFUNDBANK] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFUNDACCOUNT] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFUNDMONEY] [int] NULL ,਍ഀ
	[REFUNDDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BLACKCONDITION] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRYEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONDITIONCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ALERTMSG] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BLACKLIST] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRYEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONDITIONCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [varchar] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BOARD] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFSEQ] [int] NULL ,਍ഀ
	[LEVELS] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[UPFILE] [int] NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN1] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE1] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN2] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE2] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPSEQ] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BOARDFILE] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[FILESEQ] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BOOK] (਍ഀ
	[BOOKCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASSIFY] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKNAME] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PRICE] [int] NULL ,਍ഀ
	[DIS_PRICE] [int] NULL ,਍ഀ
	[INTRO] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WRITER] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REVIEW] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILENAME1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NEWFILENAME1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILENAME2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NEWFILENAME2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RECOM] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCANCEL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BOOKSELL] (਍ഀ
	[seq] [int] NOT NULL ,਍ഀ
	[userid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[bookcode] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[dis_price] [int] NULL ,਍ഀ
	[indate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[accountname] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[realpaymoney] [int] NULL ,਍ഀ
	[paydate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[paystat] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[receive] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[phone] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[post1] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[post2] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[addr1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[addr2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[isCancel] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[refundregdate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[refundbank] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[refundaccount] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[refundmoney] [int] NULL ,਍ഀ
	[refunddate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[refundstat] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[luserid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ldate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[tid] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BUDGET] (਍ഀ
	[GRCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRYEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PROPSTART] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPEND] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BUDGET] [decimal](10, 0) NULL ,਍ഀ
	[ISUSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BULLETIN] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[REALMOTION] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEMOTION] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_BULLETINFILE] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[FILESEQ] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CANCEL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[CANCELKIND] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CANCELDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REASON] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REASONCD] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CLASS] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASS] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASSNM] [varchar] (150) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CLASSFYMATCH] (਍ഀ
	[MATCHCODE] [varchar] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CLASSIF] (਍ഀ
	[CLASSIFICATION_IDX] [int] NOT NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ,਍ഀ
	[PURPOSE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DESCRIPTION] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[KEYWORD] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CLASSTUTOR] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASS] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TTYPE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUALBUM] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ALBUMNO] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READ_CNT] [int] NULL ,਍ഀ
	[ADD_CNT] [int] NULL ,਍ഀ
	[PARENT] [int] NULL ,਍ഀ
	[LV] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[REALVILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEPATH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILESIZE] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUALBUMREPLY] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ALBUMNO] [int] NOT NULL ,਍ഀ
	[RPLNO] [int] NOT NULL ,਍ഀ
	[CONTENT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUALDIRECT] (਍ഀ
	[DIRECTNO] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READ_CNT] [int] NULL ,਍ഀ
	[ADD_CNT] [int] NULL ,਍ഀ
	[PARENT] [int] NULL ,਍ഀ
	[LV] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUALDIRECTFILE] (਍ഀ
	[DIRECTNO] [int] NOT NULL ,਍ഀ
	[FILENO] [int] NOT NULL ,਍ഀ
	[REALVILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEPATH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILESIZE] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUALDIRECTREPLAY] (਍ഀ
	[DIRECTNO] [int] NOT NULL ,਍ഀ
	[RPLNO] [int] NOT NULL ,਍ഀ
	[CONTENT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUBASEMST] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CMU_NM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[IN_METHOD_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEARCH_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DATA_PASSWD_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISPLAY_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPE_L] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPE_M] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTRO] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[IMG_PATH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LAYOUT_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HTML_SKIN_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READ_CNT] [int] NULL ,਍ഀ
	[MEMBER_CNT] [int] NULL ,਍ഀ
	[CLOSE_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CLOSE_REASON] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CLOSE_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CLOSE_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HOLD_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ACCEPT_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ACCEPT_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUBOARD] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNO] [int] NOT NULL ,਍ഀ
	[BRDNO] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READ_CNT] [int] NULL ,਍ഀ
	[ADD_CNT] [int] NULL ,਍ഀ
	[ROOT] [int] NULL ,਍ഀ
	[PARENT] [int] NULL ,਍ഀ
	[LV] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[DISPLAY_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUBOARDFILE] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNO] [int] NOT NULL ,਍ഀ
	[BRDNO] [int] NOT NULL ,਍ഀ
	[FILENO] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEPATH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILESIZE] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUBOARDREPLAY] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNO] [int] NOT NULL ,਍ഀ
	[BRDNO] [int] NOT NULL ,਍ഀ
	[RPLNO] [int] NOT NULL ,਍ഀ
	[CONTENT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUCALENDAR] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CALNO] [int] NOT NULL ,਍ഀ
	[CALDAY] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CALTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SECURITY_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DAY_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CAL_AREA] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CYCLE_TIME] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CYCLE_CNT] [int] NULL ,਍ഀ
	[LIMIT_DAY] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOOP_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ALL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUDIRECT] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DIRECTNO] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READ_CNT] [int] NULL ,਍ഀ
	[ADD_CNT] [int] NULL ,਍ഀ
	[ROOT] [int] NULL ,਍ഀ
	[PARENT] [int] NULL ,਍ഀ
	[LV] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUDIRECTFILE] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DIRECTNO] [int] NOT NULL ,਍ഀ
	[FILENO] [int] NOT NULL ,਍ഀ
	[REALVILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEPATH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILESIZE] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUDIRECTREPLAY] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DIRECTNO] [int] NOT NULL ,਍ഀ
	[RPLNO] [int] NOT NULL ,਍ഀ
	[CONTENT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUFAQ] (਍ഀ
	[FAQ_TYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FAQNO] [int] NOT NULL ,਍ഀ
	[GRTYPE] [char] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READ_CNT] [int] NULL ,਍ഀ
	[ADD_CNT] [int] NULL ,਍ഀ
	[ROOT] [int] NULL ,਍ഀ
	[PARENT] [int] NULL ,਍ഀ
	[LV] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUFAQFILE] (਍ഀ
	[FAQ_TYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FAQNO] [int] NOT NULL ,਍ഀ
	[FILENO] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEPATH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILESIZE] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUFAQREPLAY] (਍ഀ
	[FAQ_TYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FAQNO] [int] NOT NULL ,਍ഀ
	[RPLNO] [int] NOT NULL ,਍ഀ
	[CONTENT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUGRDCODE] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[KOR_NM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENG_NM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DESCRIPT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUHONGBO] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REALFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEPATH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILESIZE] [int] NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUMAIL] (਍ഀ
	[MAILNO] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[KOR_NM] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RECV_EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CMU_NM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEND_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEND_EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGSTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOC_FG] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOC_NM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEND_FG] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEND_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEND_NM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUMENU] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNO] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READ_CD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WRITE_CD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ARRANGE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILEADD_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FILECNT] [int] NULL ,਍ഀ
	[DIRECTORY_FG] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DIRECTORY_MEMO] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BRD_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ROOT] [int] NULL ,਍ഀ
	[PARENT] [int] NULL ,਍ഀ
	[LV] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[LIMIT_LIST] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUMENULIMIT] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNO] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[READ_FG] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WRITE_FG] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUPOLICE] (਍ഀ
	[POLICENO] [int] NOT NULL ,਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CMU_NM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SINGO_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STR_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REPMEMO] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STR_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STR_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUPOLLFIELD] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[POLLNO] [int] NOT NULL ,਍ഀ
	[QUESTNO] [int] NOT NULL ,਍ഀ
	[FIELDNO] [int] NOT NULL ,਍ഀ
	[FIELD_NAME] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POLL_CNT] [int] NULL ,਍ഀ
	[ETC_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETC_NM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUPOLLMST] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[POLLNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FDTE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TDTE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOT_POLL_CNT] [int] NULL ,਍ഀ
	[STR_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BACKGROUND] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEL_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUPOLLQUEST] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[POLLNO] [int] NOT NULL ,਍ഀ
	[QUESTNO] [int] NOT NULL ,਍ഀ
	[NEED_QUESTION] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NEED_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RE_GEN_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RE_SPE_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ITEM_CNT] [int] NULL ,਍ഀ
	[REGISTER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUPOLLTICKET] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[POLLNO] [int] NOT NULL ,਍ഀ
	[QUESTNO] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEL_TEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUESTION] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SHOT_TEXT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CMUUSERMST] (਍ഀ
	[CMUNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[KOR_NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ENG_NAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MOBILE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OFFICE_TEL] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DUTY] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WK_AREA] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRADE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQUEST_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LICENSE_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LICENSE_USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CLOSE_FG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CLOSE_REASON] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CLOSE_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTRO] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RECENT_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VISIT_NUM] [int] NULL ,਍ഀ
	[SEARCH_NUM] [int] NULL ,਍ഀ
	[REGISTER_NUM] [int] NULL ,਍ഀ
	[MODIFIER_DTE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FAX] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CODE] (਍ഀ
	[GUBUN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LEVELS] [int] NOT NULL ,਍ഀ
	[CODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CODENM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[UPPER] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARENT] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CODEGUBUN] (਍ഀ
	[GUBUN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUNNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MAXLEVEL] [int] NOT NULL ,਍ഀ
	[ISSYSTEM] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COMMENTQNA] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[COMMENTSEQ] [int] NOT NULL ,਍ഀ
	[TYPES] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INUSERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTQNA] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COMMUNITY] (਍ഀ
	[COMMID] [int] NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDESC] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CATEGORYID] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REQUESTDATE] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PERMITTEDSTATUS] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PERMITTEDDATE] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REJECTEDREASON] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REJECTEDDATE] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MASTER] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISSUPERIOR] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NICKNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTROS] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TARGETS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOPICS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERCNT] [int] NULL ,਍ഀ
	[ISPUBLIC] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPERMIT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COMMUNITY_NOTICE] (਍ഀ
	[COMMID] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFSEQ] [int] NULL ,਍ഀ
	[LEVELS] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[UPFILE] [int] NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COMP] (਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMPTYPE] [int] NOT NULL ,਍ഀ
	[GROUPS] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMPANY] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GPM] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DEPT] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PART] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GROUPSNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPANYNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GPMNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARTNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPNM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEGACYGPM] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEGACYDEPT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEGACYPART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GPMSHRTNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTMRESNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTMNAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTMJIKWI] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORGA_SORT] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[AES_CODE] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COMPCLASS] (਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMPRESNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TELNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FAXNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ZIP1] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ZIP2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDELETED] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMPGUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COMPCONDITION] (਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DUTY] [int] NOT NULL ,਍ഀ
	[LANGUAGE] [int] NOT NULL ,਍ഀ
	[ALLCONDITION] [int] NOT NULL ,਍ഀ
	[YEARDUTY] [int] NULL ,਍ഀ
	[YEARLANGUAGE] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COMPMAN] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GADMIN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONFIG] (਍ഀ
	[NAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[VALS] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VALN] [int] NULL ,਍ഀ
	[SDESC] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMP1] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMP2] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMP3] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONLEARNMARK] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CHAPID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLAUID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ITEM] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CNT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONNICK] (਍ഀ
	[NICK_IDX] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NICK_NAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONQUIZ_OX] (਍ഀ
	[QUIZ_NUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHAP] [int] NULL ,਍ഀ
	[QUIZ_IDX] [int] NULL ,਍ഀ
	[ANS] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONSEXUAL_TABLE] (਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[HNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TABLE_NUM] [int] NULL ,਍ഀ
	[WRITE_DAY] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTACT] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[ADDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUEID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUETITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QUECONTENT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ANSID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ANSTITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ANSCONTENT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISMAIL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GUBUN] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CATEGORYCD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN1] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE1] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN2] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE2] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTBCHAPTER1] (਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RESULT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTBCHAPTER2] (਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTBCHAPTER3] (਍ഀ
	[NUM] [int] NOT NULL ,਍ഀ
	[SEX] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RESULT_CHECK] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTBCHAPTER4] (਍ഀ
	[NUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTBLANSWER] (਍ഀ
	[NO] [int] NOT NULL ,਍ഀ
	[LECTURE] [int] NULL ,਍ഀ
	[QUESTION] [int] NULL ,਍ഀ
	[ANSWER] [int] NULL ,਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTBLNETRO] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODIFY_COUNT] [int] NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTCHAPTER] (਍ഀ
	[CHAPID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CURRCD] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CHNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHORDER] [int] NULL ,਍ഀ
	[URL] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAGECNT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CONTCLAUSE] (਍ഀ
	[CHAPID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLAUID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLAUNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CLORDER] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COPREP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDSEQ] [decimal](3, 0) NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [decimal](3, 0) NOT NULL ,਍ഀ
	[COUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TRACK] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COPNUM] [decimal](5, 0) NULL ,਍ഀ
	[SCORE] [decimal](4, 0) NULL ,਍ഀ
	[COMMENTS] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CORRECTION] (਍ഀ
	[SEQ] [decimal](7, 0) NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMMENTS] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COURSE] (਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COURSENM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSECLASS] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOWERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRADSCORE] [int] NULL ,਍ഀ
	[GRADFAILCNT] [int] NULL ,਍ഀ
	[BIYONG] [int] NULL ,਍ഀ
	[SUBJCNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJ] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COURSEMAP] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[REALPDF] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEPDF] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALSFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVESFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALLFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVELFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TABSEQNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COURSESEQ] (਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COURSESEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COURSENM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRADSCORE] [int] NULL ,਍ഀ
	[GRADFAILCNT] [int] NULL ,਍ഀ
	[BIYONG] [int] NULL ,਍ഀ
	[SUBJCNT] [int] NULL ,਍ഀ
	[PROPSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCLOSED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[canceldays] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COURSESTOLD] (਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COURSESEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRADUDATEDCNT] [int] NULL ,਍ഀ
	[SCORE] [int] NULL ,਍ഀ
	[ISGRADUATED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COURSESUBJ] (਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ISREQUIRED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_COURSE_CHILDREN] (਍ഀ
	[CORE_CHILDREN] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_SCORE_CHILDREN] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OBJECTIVES_CHILDREN] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OBJECTIVES_SCORE_CHILDREN] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENT_DATA_CHILDREN] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENT_PREFERENCE_CHILDREN] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTERACTIONS_CHILDREN] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CPEXCELTEMP] (਍ഀ
	[INPUTTIME] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [varchar] (5) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SCORE] [decimal](5, 2) NULL ,਍ഀ
	[TSTEP] [decimal](5, 2) NULL ,਍ഀ
	[MTEST] [decimal](5, 2) NULL ,਍ഀ
	[FTEST] [decimal](5, 2) NULL ,਍ഀ
	[REPORT] [decimal](5, 2) NULL ,਍ഀ
	[ACT] [decimal](5, 2) NULL ,਍ഀ
	[ETC1] [decimal](5, 2) NULL ,਍ഀ
	[ETC2] [decimal](5, 2) NULL ,਍ഀ
	[AVTSTEP] [decimal](5, 2) NULL ,਍ഀ
	[AVMTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVFTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVREPORT] [decimal](5, 2) NULL ,਍ഀ
	[AVACT] [decimal](5, 2) NULL ,਍ഀ
	[AVETC1] [decimal](5, 2) NULL ,਍ഀ
	[AVETC2] [decimal](5, 2) NULL ,਍ഀ
	[ISGRADUATED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ERRVALUE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQGR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RANK] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SANGDAM] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CPINFO] (਍ഀ
	[CPSEQ] [varchar] (5) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CPRESNO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPNM] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HOMESITE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDRESS] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPGUBUN] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HANDPHONE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CAPTINNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BUSICATEGORY] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMPLOYEETOT] [int] NULL ,਍ഀ
	[EMPLOYEEJE] [int] NULL ,਍ഀ
	[EMPLOYEEBI] [int] NULL ,਍ഀ
	[ESTABYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ESTABMON] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ESTABDAY] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CAPITAL] [int] NULL ,਍ഀ
	[CAPITALPLAN] [int] NULL ,਍ഀ
	[CAPITALRESULT] [int] NULL ,਍ഀ
	[OWNSUBJ] [int] NULL ,਍ഀ
	[GOYONOWNSUBJ] [int] NULL ,਍ഀ
	[BIGOYONOWNSUBJ] [int] NULL ,਍ഀ
	[DEVSUBJ] [int] NULL ,਍ഀ
	[GOYONDEVSUBJ] [int] NULL ,਍ഀ
	[BIGOYONDEVSUBJ] [int] NULL ,਍ഀ
	[DEVSYSTEM] [int] NULL ,਍ഀ
	[FAMILYSITE] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VISION] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MISSION] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAINBUSI] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBUSI] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OWNSOLUTION] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PRIZERECORD] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[AUTH] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SYSTEMNM] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SPECIAL] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BIGO] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RESNO] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CPPARAM] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERIDPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAMEPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RESNOPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONOPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PWDPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNMPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWIPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINMPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPANYNMPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GADMINPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE1] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE2] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM3] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE3] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM4] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE4] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM5] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE5] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM6] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE6] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_CPUPDATESTATUS] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NEWFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUN] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNNUM] [int] NOT NULL ,਍ഀ
	[DAMUNTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DAMUNTEXT] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCOUNT] [int] NULL ,਍ഀ
	[SELMAX] [int] NULL ,਍ഀ
	[FSCALECODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SSCALECODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNEACH] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNNUMS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FANSWERS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SANSWERS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNMAIL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[MAILNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FRETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FRETURNTIME] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SRETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SRETURNTIME] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAILGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNMAILING] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RELATION] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPANYNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DAMUNTEXT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNMEMBER] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNOBEACH] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[SUBJUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OBUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RELATION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DAMUNNUMS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FANSWERS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SANSWERS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNOBMAIL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[MAILNUM] [int] NOT NULL ,਍ഀ
	[SUBJUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OBUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FRETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FRETURNTIME] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SRETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SRETURNTIME] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAILGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNOBSERVER] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[SUBJUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OBUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RELATION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNPAPER] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNPAPERNUM] [int] NOT NULL ,਍ഀ
	[D_GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DAMUNPAPERNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOTCNT] [int] NULL ,਍ഀ
	[DAMUNNUMS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FDAMUNSTART] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FDAMUNEND] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDAMUNSTART] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDAMUNEND] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DAMUNSEL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DAMUNNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCALENAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELPOINT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DATABOARD] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REFSEQ] [int] NULL ,਍ഀ
	[LEVELS] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[UPFILECNT] [int] NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RECOMMEND] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DEPTM] (਍ഀ
	[GRPCOMP] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DEPTM] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DEPTMNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DIAGNOSTIC_INFO] (਍ഀ
	[ERROR_CODE] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ERROR_CONTENT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DIC] (਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[WORDS] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GROUPS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[IMGURL] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DESCS] [text] COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DICGROUP] (਍ഀ
	[GROUPS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_DISCOUNT] (਍ഀ
	[GRTYPE] [char] (5) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DISCOUNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EDUTARGET] (਍ഀ
	[MASTERCD] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPROPOSEAPPROVAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EDU_LAN] (਍ഀ
	[EDUCATIONAL_LANGUAGE_IDX] [int] NOT NULL ,਍ഀ
	[LANGUAGE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EDU_ROL] (਍ഀ
	[EDUCATINAL_INTENDUSERROLE_IDX] [int] NOT NULL ,਍ഀ
	[INTENDEDENDUSERROLE] [varchar] (15) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ERROR_INFO] (਍ഀ
	[ERROR_CODE] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ERROR_CONTENT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ETEST] (਍ഀ
	[ETESTSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTNUM] [int] NOT NULL ,਍ഀ
	[ETESTTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXPTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVELS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCNT] [int] NULL ,਍ഀ
	[SAVEIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ETESTMASTER] (਍ഀ
	[ETESTSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTTEXT] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTLIMIT] [int] NULL ,਍ഀ
	[TOTALSCORE] [int] NULL ,਍ഀ
	[ETESTPOINT] [int] NULL ,਍ഀ
	[ETESTCNT] [int] NULL ,਍ഀ
	[LEVEL1TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL2TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL3TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNTLEVEL1] [int] NULL ,਍ഀ
	[CNTLEVEL2] [int] NULL ,਍ഀ
	[CNTLEVEL3] [int] NULL ,਍ഀ
	[ISOPENANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENEXP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAPERCNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETRYNUM] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ETESTMEMBER] (਍ഀ
	[ETESTSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TRYCNT] [int] NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ETESTPAPER] (਍ഀ
	[ETESTSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTNUM] [int] NOT NULL ,਍ഀ
	[ETEST] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WHEREPAPER] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTLIMIT] [int] NULL ,਍ഀ
	[TOTALSCORE] [decimal](10, 0) NULL ,਍ഀ
	[ETESTPOINT] [int] NULL ,਍ഀ
	[ETESTCNT] [int] NULL ,਍ഀ
	[LEVEL1TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL2TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL3TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNTLEVEL1] [int] NULL ,਍ഀ
	[CNTLEVEL2] [int] NULL ,਍ഀ
	[CNTLEVEL3] [int] NULL ,਍ഀ
	[ISOPENANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENEXP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ETESTRESULT] (਍ഀ
	[ETESTSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETEST] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTCNT] [int] NULL ,਍ഀ
	[ETESTPOINT] [int] NULL ,਍ഀ
	[SCORE] [decimal](3, 0) NULL ,਍ഀ
	[ANSWERCNT] [int] NULL ,਍ഀ
	[STARTED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TIME] [int] NULL ,਍ഀ
	[ANSWER] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORRECTED] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ETESTSEL] (਍ഀ
	[ETESTSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ETESTNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ETESTSUBJ] (਍ഀ
	[ETESTSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETESTSUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EXAM] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXAMNUM] [int] NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXPTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVELS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCOUNT] [int] NULL ,਍ഀ
	[SAVEIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EXAMMASTER] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXAMTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSONSTART] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSONEND] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMPOINT] [decimal](10, 0) NULL ,਍ഀ
	[EXAMCNT] [int] NULL ,਍ഀ
	[TOTALSCORE] [decimal](3, 0) NULL ,਍ഀ
	[STARTDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL1TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL2TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL3TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENEXP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETRYCNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNTLEVEL1] [int] NULL ,਍ഀ
	[CNTLEVEL2] [int] NULL ,਍ഀ
	[CNTLEVEL3] [int] NULL ,਍ഀ
	[PROGRESS] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EXAMPAPER] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXAMTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PAPERNUM] [int] NOT NULL ,਍ഀ
	[LESSONSTART] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSONEND] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMPOINT] [decimal](3, 0) NULL ,਍ഀ
	[EXAMCNT] [int] NULL ,਍ഀ
	[TOTALSCORE] [decimal](3, 0) NULL ,਍ഀ
	[STARTDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDDT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL1TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL2TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL3TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENEXP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETRYCNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNTLEVEL1] [int] NULL ,਍ഀ
	[CNTLEVEL2] [int] NULL ,਍ഀ
	[CNTLEVEL3] [int] NULL ,਍ഀ
	[PROGRESS] [decimal](5, 2) NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EXAMRESULT] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXAMTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXAM] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMCNT] [int] NULL ,਍ഀ
	[EXAMPOINT] [decimal](3, 0) NULL ,਍ഀ
	[SCORE] [decimal](3, 0) NULL ,਍ഀ
	[ANSWERCNT] [int] NULL ,਍ഀ
	[STARTED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TIME] [int] NULL ,਍ഀ
	[ANSWER] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORRECTED] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERRETRY] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EXAMRESULTTEMP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAPERNUM] [int] NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAM] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMCNT] [int] NULL ,਍ഀ
	[EXAMPOINT] [decimal](3, 0) NULL ,਍ഀ
	[SCORE] [decimal](3, 0) NULL ,਍ഀ
	[ANSWERCNT] [int] NULL ,਍ഀ
	[STARTED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TIME] [int] NULL ,਍ഀ
	[ANSWER] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORRECTED] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERRETRY] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_EXAMSEL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EXAMNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_FAQ] (਍ഀ
	[FAQCATEGORY] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FNUM] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_FAQ_CATEGORY] (਍ഀ
	[FAQCATEGORY] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FAQCATEGORYNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FAQGUBUN] [int] NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GADMIN] (਍ഀ
	[GADMIN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONTROL] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GADMINNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTS] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISNEEDSUBJ] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISNEEDCOMP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISNEEDDEPT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISNEEDGRCODE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPLEVEL] [int] NULL ,਍ഀ
	[PADMIN] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEQ] [int] NULL ,਍ഀ
	[ISNEEDOUTCOMP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISVIEW] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GEN_CAT] (਍ഀ
	[GENERAL_CATALOG_IDX] [int] NOT NULL ,਍ഀ
	[CATALOG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ENTRY] [varchar] (255) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GEN_COV] (਍ഀ
	[GENERAL_COVERAGE_IDX] [int] NOT NULL ,਍ഀ
	[COVERAGE] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GEN_DES] (਍ഀ
	[GENERAL_DESCRIPTION_IDX] [int] NOT NULL ,਍ഀ
	[DESCRIPTION] [varchar] (255) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GEN_KEY] (਍ഀ
	[GENERAL_KEYWORD_IDX] [int] NOT NULL ,਍ഀ
	[KEYWORD] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GEN_LAN] (਍ഀ
	[GENERAL_LANGUAGE_IDX] [int] NOT NULL ,਍ഀ
	[LANGUAGE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GONG] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TYPES] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADCONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GONGSAMPLE] (਍ഀ
	[TYPES] [varchar] (5) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADCONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GRCODE] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODENM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[IDTYPE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MANAGER] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MASTER] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REPDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPCNT] [int] NULL ,਍ഀ
	[DOMAIN] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHKFIRST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHKFINAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISLOGIN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISJIK] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISONLYGATE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSEBILL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETCDATA] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CODE_ORDER] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GRCODEMAN] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GADMIN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GRCOMP] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GRRECOM] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJCOURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[isnew] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISSEQ] [int] NULL ,਍ഀ
	[GRPCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRPNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GRSEQ] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PROPS] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_GRSUBJ] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJCOURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ISCOURSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISNEW] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISSEQ] [int] NULL ,਍ഀ
	[GRPCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRPNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_HOMECOUNT] (਍ഀ
	[GUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_MONTH] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_DAY] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_TIME] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_WEEK] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CNT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_HOMEFILE] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TYPES] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FILESEQ] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_HOMEMENU] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUID] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[KIND] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[POSITION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERS] [int] NULL ,਍ഀ
	[MENUNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUURL] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUOVERIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_HOMEMENU_MASTER] (਍ഀ
	[GRTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUID] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[KIND] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[POSITION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERS] [int] NULL ,਍ഀ
	[MENUNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUURL] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUOVERIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_HOMEQNA] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TYPES] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CATEGORYCD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN1] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE1] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN2] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE2] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RECOMMEND] [int] NULL ,਍ഀ
	[RETMAILING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RESUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_HUMANTOUCH] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TOUCH] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ISMAIL] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EDUSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDESC] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOK] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REASON] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISMAILOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEQGRNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_INTERACTIONS] (਍ഀ
	[INTERACTIONS_NUM] [int] NOT NULL ,਍ഀ
	[INTERACTIONS_ID] [varchar] (500) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INTERACTIONS_TIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INTERACTIONS_TYPE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INTERACTIONS_WEIGHTING] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INTERACTIONS_STUDENT_RESPONSE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INTERACTIONS_RESULT] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INTERACTIONS_LATENCY] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_INTEREST] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INDATE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_INTER_COR] (਍ഀ
	[INTERACTIONS_NUM] [int] NOT NULL ,਍ഀ
	[INTERACTIONS_COR_RES_NUM] [int] NOT NULL ,਍ഀ
	[INTERACTIONS_COR_RES_PATTERN] [varchar] (500) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_INTER_OBJ] (਍ഀ
	[INTERACTIONS_NUM] [int] NOT NULL ,਍ഀ
	[INTERACTIONS_OBJECTIVES_NUM] [int] NOT NULL ,਍ഀ
	[INTERACTIONS_OBJECTIVES_ID] [varchar] (500) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_JIKMU] (਍ഀ
	[GRPCOMP] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKMU] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKMUNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_JIKUN] (਍ഀ
	[GRPCOMP] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKUNNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_JIKUP] (਍ഀ
	[GRPCOMP] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKUP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKUPNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_JIKWI] (਍ഀ
	[GRPCOMP] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKWI] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_JINDAN] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JINDANNUM] [int] NOT NULL ,਍ഀ
	[JINDANTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JINDANTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXPTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVELS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCOUNT] [int] NULL ,਍ഀ
	[SAVEIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_JINDANRESULT] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOWERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JINDAN] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JINDANCNT] [int] NULL ,਍ഀ
	[JINDANPOINT] [decimal](3, 0) NULL ,਍ഀ
	[SCORE] [decimal](3, 0) NULL ,਍ഀ
	[ANSWERCNT] [int] NULL ,਍ഀ
	[STARTED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ANSWER] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORRECTED] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_JINDANSEL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[JINDANNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_KNOWCODE] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJCLASS] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LOWERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASSNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LANGUAGE] (਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[LANGNAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGSUBJ1] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGSUBJ2] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGSUBJ3] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGSUBJ4] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGSUBJ5] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGSUBCNT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LETTER] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ADDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADTITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADNAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADCONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[UPFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOGINYN] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEYN] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPCD] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POPWIDTH] [int] NULL ,਍ഀ
	[POPHEIGHT] [int] NULL ,਍ഀ
	[POPXPOS] [int] NULL ,਍ഀ
	[POPYPOS] [int] NULL ,਍ഀ
	[REALFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POPUP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USELIST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEFRAME] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISALL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODECD] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMAPP] (਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[APPLDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COWORKERCONO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SITESEQ] [int] NULL ,਍ഀ
	[APPNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SITENAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SITEROOM] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMTIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTRACT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMAPP_IMSI] (਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[APPLDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COWORKERCONO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SITESEQ] [int] NULL ,਍ഀ
	[APPNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SITENAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SITEROOM] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMTIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTRACT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMASSIGN] (਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[SITESEQ] [int] NOT NULL ,਍ഀ
	[LANGCODE] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMASSIGN_IMSI] (਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[SITESEQ] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMHST] (਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGNAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGTNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGVNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORGA_ENAME] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWI] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE1] [decimal](4, 1) NULL ,਍ഀ
	[SCORE2] [decimal](4, 1) NULL ,਍ഀ
	[SCORE3] [decimal](4, 1) NULL ,਍ഀ
	[SCORE4] [decimal](4, 1) NULL ,਍ഀ
	[SCORE5] [decimal](4, 1) NULL ,਍ഀ
	[TSCORE] [decimal](5, 1) NULL ,਍ഀ
	[ISPASS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LNAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PERCENT] [decimal](3, 0) NULL ,਍ഀ
	[RESNO] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERGUBUN] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DIVICOD] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMHST_IMSI] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[LANGDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGNAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGTNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGVNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPNO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORGA_ENAME] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWI] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE1] [decimal](4, 1) NULL ,਍ഀ
	[SCORE2] [decimal](4, 1) NULL ,਍ഀ
	[SCORE3] [decimal](4, 1) NULL ,਍ഀ
	[SCORE4] [decimal](4, 1) NULL ,਍ഀ
	[SCORE5] [decimal](4, 1) NULL ,਍ഀ
	[TSCORE] [decimal](5, 1) NULL ,਍ഀ
	[ISPASS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LNAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PERCENT] [decimal](3, 0) NULL ,਍ഀ
	[RESNO] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERGUBUN] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DIVICOD] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMINFO] (਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[LANGVNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGSTART] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGEND] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISPDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISABLE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDISPNOTICE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCOWORKER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NOTICE] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPOPUP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POPUPDAY] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMINFO_IMSI] (਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[LANGEXECSEQ] [int] NOT NULL ,਍ഀ
	[LANGVNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LANGDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGSTART] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGEND] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISPDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISABLE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDISPNOTICE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCOWORKER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NOTICE] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPOPUP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POPUPDAY] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LEXAMSITE] (਍ഀ
	[LANGCODE] [int] NOT NULL ,਍ഀ
	[SITESEQ] [int] NOT NULL ,਍ഀ
	[SITENAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LIF_CEN] (਍ഀ
	[LIFECYCLE_CONTR_CENTITY_IDX] [int] NOT NULL ,਍ഀ
	[CENTITY] [varchar] (3000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LIFECYCLE_CONTRIBUTE_IDX] [int] NOT NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LIF_CON] (਍ഀ
	[LIFECYCLE_CONTRIBUTE_IDX] [int] NOT NULL ,਍ഀ
	[LIFECYCLE_CONTR_ROLE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LIFECYCLE_CONTR_DATE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_LINKSITE] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[SORT] [int] NULL ,਍ഀ
	[SITENM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[URL] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BANNER] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISLOGIN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERIDPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAMEPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RESNOPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONOPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PWDPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNMPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWIPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINMPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPANYNMPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GADMINPARAM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE1] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE2] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM3] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE3] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM4] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE4] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM5] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE5] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAM6] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMVALUE6] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MANAGER] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GADMIN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDELETED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FMON] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMON] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTED] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MASTERCD] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MASTERCD] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MASTERNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPOSETYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISEDUTARGET] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MASTERSUBJ] (਍ഀ
	[MASTERCD] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJCOURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GYEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRPCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRPNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MEMBER] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENG_NAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RESNO] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PWD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST1] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST2] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP_POST1] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP_POST2] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP_ADDR1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP_ADDR2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HOMETEL] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HANDPHONE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPTEL] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPTEXT] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEGREE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKUP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISMAILING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISLETTERING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MEMBERGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGISTGUBUN] [char] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STATE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VALIDATION] [int] NULL ,਍ഀ
	[LGFIRST] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGLAST] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGCNT] [int] NULL ,਍ഀ
	[LGFAIL] [int] NULL ,਍ഀ
	[LGIP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[KOCCASUPERYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GAMESUPERYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKUPNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWI] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OFFICE_GBN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OFFICE_GBNNM] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WORK_PLC] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WORK_PLCNM] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTCOD] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNAM] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL_LINE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MEMBERTEMP] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RESNO] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PWD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST1] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST2] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HOMETEL] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HANDPHONE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPTEL] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL_LINE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGCNT] [int] NULL ,਍ഀ
	[LGLAST] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGIP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKUP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKUPNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWI] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OFFICE_GBN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OFFICE_GBNNM] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WORK_PLC] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WORK_PLCNM] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTCOD] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNAM] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGFIRST] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISMAILING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDTXT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[AESID] [varchar] (60) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VALIDATION] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MEMBER_MILEAGE] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[POINT] [int] NULL ,਍ഀ
	[USEMEMO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MENU] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [char] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNM] [varchar] (40) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LEVELS] [int] NOT NULL ,਍ഀ
	[UPPER] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARENT] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDISPLAY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA3] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA4] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA5] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA6] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA7] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA8] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA9] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA10] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA11] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARA12] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERS] [int] NULL ,਍ഀ
	[CREATED] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SYSTEMGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MENUAUTH] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [char] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUSUBSEQ] [int] NOT NULL ,਍ഀ
	[GADMIN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONTROL] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SYSTEMGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MENUCOUNT] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUID] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CNT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MENUSUB] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [char] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[SERVLET] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODULENM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SYSTEMGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MENUSUBPROCESS] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [char] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[PROCESS] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SERVLETTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METHOD] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MET_CAT] (਍ഀ
	[METAMETA_CATALOG_IDX] [int] NOT NULL ,਍ഀ
	[CATALOG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENTRY] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MET_CEN] (਍ഀ
	[METAMETA_CONTR_CENTITY_IDX] [int] NOT NULL ,਍ഀ
	[METAMETA_CONTRIBUTE_IDX] [int] NOT NULL ,਍ഀ
	[CENTITY] [varchar] (3000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MET_CON] (਍ഀ
	[METAMETA_CONTRIBUTE_IDX] [int] NOT NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ,਍ഀ
	[META_CONTR_ROLE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[META_CONTR_DATE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MET_M] (਍ഀ
	[METADATA_IDX] [int] NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GENERAL_TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GENERAL_STRUCTURE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GENERAL_AGGREGATIONLEVEL] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LIFECYCLE_VERSION] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LIFECYCLE_STATUS] [varchar] (15) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METAMETA_LANGUAGE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TECHNICAL_SIZE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TECHNICAL_INSTALLATIONREMARKS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TECHNICAL_OTHERREQUIREMENTS] [varchar] (3000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TECHNICAL_DURATION] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUCATIONAL_INTERACTIVITYTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUCATIONAL_INTERACTIVITYLEVEL] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUCATIONAL_SEMANTICDENSITY] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUCATIONAL_DIFFICULTY] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUCATIONAL_LEARNINGTIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUCATIONAL_DESCRIPTION] [varchar] (3000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RIGHTS_COST] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RIGHTS_COPYRIGHTRESTRICTIONS] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RIGHTS_DESCRIPTION] [varchar] (3000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[T_FORMAT] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[T_LOCATION] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[T_LOCATIONTYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[E_LEARNINGTYPE] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[E_CONTEXT] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[E_TYPICALAGERANGE] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MET_SCH] (਍ഀ
	[METADATA_SCHEME_IDX] [int] NOT NULL ,਍ഀ
	[METADATA_SCHEME] [varchar] (255) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MFMENU] (਍ഀ
	[MENU] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ISREQUIRED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGM] [varchar] (80) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM3] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM4] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM5] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGMTYPE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_MFSUBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENUNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PGM] [varchar] (80) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM3] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM4] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PGRAM5] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERS] [int] NULL ,਍ഀ
	[PGMTYPE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_NOTICE] (਍ഀ
	[TABSEQ] [int] NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ADDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADTITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADNAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADCONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[UPFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOGINYN] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEYN] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPCD] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POPWIDTH] [int] NULL ,਍ഀ
	[POPHEIGHT] [int] NULL ,਍ഀ
	[POPXPOS] [int] NULL ,਍ഀ
	[POPYPOS] [int] NULL ,਍ഀ
	[REALFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POPUP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USELIST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEFRAME] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISALL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODECD] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_NOTICE_TEMPLET] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[ADDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADTITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADNAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEMPLETFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OBJATT] (਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ATT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OBJECT] (਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OTYPE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FILETYPE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[NPAGE] [int] NOT NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MASTER] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTING] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SERVER] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PARAMETERSTRING] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[IDENTIFIER] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PREREQUISITES] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MASTERYSCORE] [int] NULL ,਍ഀ
	[MAXTIMEALLOWED] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TIMELIMITACTION] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SEQUENCE] [int] NULL ,਍ഀ
	[THELEVEL] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OIDNUMBER] [int] NULL ,਍ഀ
	[HIGHOID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METALOCATION] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCOLOCATE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCOALL] [int] NULL ,਍ഀ
	[SCOTITLE] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DATAFROMLMS] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PRODUCER] [varchar] (18) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[sdesc2] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OBJECTIVES] (਍ഀ
	[OBJECTIVES_NUM] [int] NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OBJECTIVES_ID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OBJECTIVES_SCORE_ROW] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OBJECTIVES_SCORE_MAX] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OBJECTIVES_SCORE_MIN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OBJECTIVES_STATUS] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OFFGALLERY] (਍ഀ
	[seq] [int] NOT NULL ,਍ഀ
	[title] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[contents] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[indate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ldate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[userid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[luserid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[name] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[realfile_L] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[savefile_L] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[media_realfile] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[media_savefile] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[grcode] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[grtype] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[cnt] [int] NULL ,਍ഀ
	[realfile_S] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[savefile_S] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[useyn] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OFFLINEPROPOSE] (਍ഀ
	[seq] [int] NOT NULL ,਍ഀ
	[grcode] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[userid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ldate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[status] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OFFLINESUBJ] (਍ഀ
	[seq] [int] NOT NULL ,਍ഀ
	[grcode] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[subjgubun] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[subj] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[subjseq] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[propstart] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[propend] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[subjnm] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[tuserid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[tname] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[dday] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[starttime] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[endtime] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[place] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[limitmember] [int] NULL ,਍ഀ
	[target] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[content] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[luserid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ldate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[useYn] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[readcnt] [int] NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OFFSUBJLECTURE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECTURE] [int] NOT NULL ,਍ഀ
	[LECTDATE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECTSTTIME] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LECTTIME] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TUTORID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LECTSCORE] [int] NULL ,਍ഀ
	[LECTLEVEL] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OPENFORUM] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TYPES] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[RECOMMEND] [int] NULL ,਍ഀ
	[COMMENTCNT] [int] NULL ,਍ഀ
	[SUBJECTSEQ] [int] NULL ,਍ഀ
	[CATEGORYCD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OPENYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OPENFORUMCOMMENT] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[COMMENTSEQ] [int] NOT NULL ,਍ഀ
	[TYPES] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INUSERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTQNA] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OPENFORUMSUBJECT] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJECTSEQ] [int] NOT NULL ,਍ഀ
	[SUBJECT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMONTH] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYEAR] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OUTCOMPMAN] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GADMIN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_OUTMEMBER] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RESNO] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PWD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONO] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST1] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST2] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HOMETEL] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HANDPHONE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPTEL] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL_LINE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGCNT] [decimal](6, 0) NULL ,਍ഀ
	[LGLAST] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGIP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKUP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKUPNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWI] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OFFICE_GBN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OFFICE_GBNNM] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WORK_PLC] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WORK_PLCNM] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTCOD] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNAM] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGFIRST] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_POINTITEM] (਍ഀ
	[CODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (128) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POINT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_POLL] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[STARTED] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDED] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[F_USE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_POLLLOG] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[IP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMP1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMP2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TMP3] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELNUM] [int] NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_POLLSEL] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_POSTSCRIPT] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[POINT] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PRECOURSE] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PREVIEW] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJTEXT] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUMANS] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTRO] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXPLAIN] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MEMO] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXPECT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MASTER] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MASEMAIL] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RECOMMENDER] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RECOMMEND] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PREVIEWOBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OIDNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERING] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PREVIEW_LOG] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[grcode] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PROGRESS] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PARAMETERSTRING] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSONSTATUS] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PREREQUISITES] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXIT] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENTRY] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MASTERYSCORE] [int] NULL ,਍ഀ
	[SEQUENCE] [int] NULL ,਍ഀ
	[TYPE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CREDIT] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SESSION_TIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOTAL_TIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSON_MODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE_RAW] [int] NULL ,਍ഀ
	[FIRST_EDU] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FIRST_END] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSON_COUNT] [int] NULL ,਍ഀ
	[LESSONSTATUSBEST] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PROJASSIGN] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDSEQ] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROJSEQ] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PROJGRP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDSEQ] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PROJGRP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PROJNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHIEF] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PROJORD] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDSEQ] [int] NOT NULL ,਍ഀ
	[PROJSEQ] [decimal](3, 0) NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GROUPCNT] [int] NULL ,਍ഀ
	[REPTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPENSCORE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](4, 0) NULL ,਍ഀ
	[EXPIREDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILE2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSEDCOPY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILE2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILEZISE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILESIZE2] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ANSYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PROJREP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDSEQ] [int] NOT NULL ,਍ഀ
	[PROJID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CONTENTS] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISFINAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](5, 2) NULL ,਍ഀ
	[UPFILE] [varchar] (150) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUTITLE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUCONTENTS] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUUPFILE] [varchar] (250) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE_TMP] [decimal](5, 2) NULL ,਍ഀ
	[SCORE_MAS] [decimal](5, 2) NULL ,਍ഀ
	[RETREASON] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISRET] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILESIZE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FINALSCORE] [decimal](5, 2) NULL ,਍ഀ
	[CONTENTSBYTE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROJSEQ] [int] NULL ,਍ഀ
	[RESEND] [int] NULL ,਍ഀ
	[COPYUPNM] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COPYSIZE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COPYBYTE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETMAILING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PROJREPHALF] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDSEQ] [int] NOT NULL ,਍ഀ
	[PROJID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILESIZE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTSBYTE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROJSEQ] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_PROPOSE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIK] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPDATE] [char] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDINSERT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISB2C] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCHKFIRST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHKFIRST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPROPOSEAPPROVAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHIEFDISTXT] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHIEFMAIL] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHIEFUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHIEFDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHKFINAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPTXT] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BILLSTAT] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDCODE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CANCELKIND] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REJECTEDREASON] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REJECTKIND] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[tid] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_QNA] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[KIND] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REPLYGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CATEGORYCD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN1] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID1] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE1] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKYN2] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKUSERID2] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OKDATE2] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REPLYUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REPLYUSERNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REPLYDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_QNAFILE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[KIND] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FILESEQ] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_RELAT] (਍ഀ
	[RELATION_IDX] [int] NOT NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ,਍ഀ
	[RELATION_KIND] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RELATION_RESOURCE] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RELATION_DESCRIPTION] [varchar] (3000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SANGDAM] (਍ഀ
	[NO] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CTEXT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STATUS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MCODE] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCODE] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETIME] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FTEXT] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RSEQ] [int] NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SCALE] (਍ഀ
	[SCALECODE] [int] NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[S_GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCALETYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCALENAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDEL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SCALESEL] (਍ഀ
	[SCALECODE] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELPOINT] [int] NULL ,਍ഀ
	[SELTEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SCOLOCATE] (਍ഀ
	[SCONUMBER] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SCOSUBJOBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TYPE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDERING] [int] NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SESSIONINFO] (਍ഀ
	[SESSIONID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERIP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOCODE] (਍ഀ
	[DISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SOGUBUN] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DISTNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVELS] [int] NULL ,਍ഀ
	[UPCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NOTICE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORDERING] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SODIAGNOS] (਍ഀ
	[SODIAGNOSNUM] [int] NOT NULL ,਍ഀ
	[SODIAGNOSTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SODIAGNOSTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SOEXPTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVELS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCOUNT] [int] NULL ,਍ഀ
	[SAVEIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SODIAGNOSPAPER] (਍ഀ
	[PAPERNUM] [int] NOT NULL ,਍ഀ
	[LESSONSTART] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSONEND] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DIAGNOSPOINT] [int] NULL ,਍ഀ
	[DIAGNOSCNT] [int] NULL ,਍ഀ
	[TOTALSCORE] [decimal](3, 0) NULL ,਍ഀ
	[LEVEL1TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL2TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL3TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNTLEVEL1] [int] NULL ,਍ഀ
	[CNTLEVEL2] [int] NULL ,਍ഀ
	[CNTLEVEL3] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAPERNM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SODIAGNOSSEL] (਍ഀ
	[SODIAGNOSNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOEVENT] (਍ഀ
	[SOEVENTNUM] [int] NOT NULL ,਍ഀ
	[EVENTNM] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXPLAIN] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SPECIAL] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGUSERID] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REGNAME] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOEXAM] (਍ഀ
	[SOEXAMNUM] [int] NOT NULL ,਍ഀ
	[SOEXAMTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SOEXAMTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SOEXPTEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVELS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCOUNT] [int] NULL ,਍ഀ
	[SAVEIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALIMAGE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALAUDIO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALMOVIE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFLASH] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOEXAMPAPER] (਍ഀ
	[PAPERNUM] [int] NOT NULL ,਍ഀ
	[LESSONSTART] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSONEND] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXAMPOINT] [int] NULL ,਍ഀ
	[EXAMCNT] [int] NULL ,਍ഀ
	[TOTALSCORE] [decimal](3, 0) NULL ,਍ഀ
	[LEVEL1TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL2TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LEVEL3TEXT] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNTLEVEL1] [int] NULL ,਍ഀ
	[CNTLEVEL2] [int] NULL ,਍ഀ
	[CNTLEVEL3] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PAPERNM] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOEXAMSEL] (਍ഀ
	[SOEXAMNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISANSWER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOSUL] (਍ഀ
	[SULNUM] [int] NOT NULL ,਍ഀ
	[DISTCODE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULTEXT] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCOUNT] [int] NULL ,਍ഀ
	[SELMAX] [int] NULL ,਍ഀ
	[SULRETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCALECODE] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SODISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOSULPAPER] (਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[TOTCNT] [int] NULL ,਍ഀ
	[SULNUMS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULSTART] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULEND] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULPAPERNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SODISTCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SOSULSEL] (਍ഀ
	[SULNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELPOINT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SRCHMEMBERLOG] (਍ഀ
	[LOGDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SRCHWORD] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ROWCNT] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STOLD] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[NAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPT] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIK] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](5, 2) NULL ,਍ഀ
	[TSTEP] [decimal](5, 2) NULL ,਍ഀ
	[MTEST] [decimal](5, 2) NULL ,਍ഀ
	[FTEST] [decimal](5, 2) NULL ,਍ഀ
	[REPORT] [decimal](5, 2) NULL ,਍ഀ
	[ACT] [decimal](5, 2) NULL ,਍ഀ
	[ETC1] [decimal](5, 2) NULL ,਍ഀ
	[ETC2] [decimal](5, 2) NULL ,਍ഀ
	[AVTSTEP] [decimal](5, 2) NULL ,਍ഀ
	[AVMTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVFTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVREPORT] [decimal](5, 2) NULL ,਍ഀ
	[AVACT] [decimal](5, 2) NULL ,਍ഀ
	[AVETC1] [decimal](5, 2) NULL ,਍ഀ
	[AVETC2] [decimal](5, 2) NULL ,਍ഀ
	[ISGRADUATED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISB2C] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SERNO] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISRESTUDY] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVHTEST] [decimal](5, 2) NULL ,਍ഀ
	[NOTGRADUCD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NOTGRADUETC] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CREDIT] [decimal](3, 1) NULL ,਍ഀ
	[ISOLD] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CREDITEXAM] [decimal](1, 0) NULL ,਍ഀ
	[ISGOYONG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STOLDHST] (਍ഀ
	[SUBJ] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[NAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ORGLECCODE] [varchar] (17) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](5, 2) NULL ,਍ഀ
	[ISGRADUATED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SERNO] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STUDENT] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASS] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDINSERT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](5, 2) NULL ,਍ഀ
	[TSTEP] [decimal](5, 2) NULL ,਍ഀ
	[MTEST] [decimal](5, 2) NULL ,਍ഀ
	[FTEST] [decimal](5, 2) NULL ,਍ഀ
	[REPORT] [decimal](5, 2) NULL ,਍ഀ
	[ACT] [decimal](5, 2) NULL ,਍ഀ
	[ETC1] [decimal](5, 2) NULL ,਍ഀ
	[ETC2] [decimal](5, 2) NULL ,਍ഀ
	[AVTSTEP] [decimal](5, 2) NULL ,਍ഀ
	[AVMTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVFTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVREPORT] [decimal](5, 2) NULL ,਍ഀ
	[AVACT] [decimal](5, 2) NULL ,਍ഀ
	[AVETC1] [decimal](5, 2) NULL ,਍ഀ
	[AVETC2] [decimal](5, 2) NULL ,਍ഀ
	[ISGRADUATED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISRESTUDY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISB2C] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BRANCH] [int] NULL ,਍ഀ
	[CONFIRMDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUNO] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVHTEST] [decimal](5, 2) NULL ,਍ഀ
	[NOTGRADUETC] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUSTATUS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SERNO] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISGOYONG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAMTOTAL] [decimal](5, 2) NULL ,਍ഀ
	[RANK] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VALIDATION] [decimal](1, 0) NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STUDENTREJECT] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASS] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDINSERT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](5, 2) NULL ,਍ഀ
	[TSTEP] [decimal](5, 2) NULL ,਍ഀ
	[HTEST] [decimal](5, 2) NULL ,਍ഀ
	[MTEST] [decimal](5, 2) NULL ,਍ഀ
	[FTEST] [decimal](5, 2) NULL ,਍ഀ
	[REPORT] [decimal](5, 2) NULL ,਍ഀ
	[ACT] [decimal](5, 2) NULL ,਍ഀ
	[ETC1] [decimal](5, 2) NULL ,਍ഀ
	[ETC2] [decimal](5, 2) NULL ,਍ഀ
	[AVTSTEP] [decimal](5, 2) NULL ,਍ഀ
	[AVHTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVMTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVFTEST] [decimal](5, 2) NULL ,਍ഀ
	[AVREPORT] [decimal](5, 2) NULL ,਍ഀ
	[AVACT] [decimal](5, 2) NULL ,਍ഀ
	[AVETC1] [decimal](5, 2) NULL ,਍ഀ
	[AVETC2] [decimal](5, 2) NULL ,਍ഀ
	[ISGRADUATED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISRESTUDY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISB2C] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BRANCH] [int] NULL ,਍ഀ
	[CONFIRMDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUNO] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NOTGRADUETC] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUSTATUS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STUDENT_PRE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[STUDENT_PREFERENCE_AUDIO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENT_PREFERENCE_LANGUAGE] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENT_PREFERENCE_SPEED] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENT_PREFERENCE_TEXT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STUDYCONTROL] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[COMPANY] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GUBUN] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTDT] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDDT] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDTIME] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISHOLIDAY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DAY1] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DAY2] [char] (2) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STUDYCONTROLEXP] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[COMPANY] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REASON] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_STUDYCOUNT] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MENU] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CNT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ISONOFF] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJCLASS] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOWERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SPECIALS] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISGOYONG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GOYONGPRICE] [int] NULL ,਍ഀ
	[ISPROPOSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPOSETYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFTYPE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISMFMENUIMG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFORDER] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFDLIST] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFSTART] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFNMTYPE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MFGRDATE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OTBGCOLOR] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCENTERED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BIYONG] [int] NULL ,਍ഀ
	[EDUDAYS] [int] NULL ,਍ഀ
	[EDUTIMES] [int] NULL ,਍ഀ
	[EDUTYPE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENTLIMIT] [int] NULL ,਍ഀ
	[USEBOOK] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKPRICE] [int] NULL ,਍ഀ
	[OWNER] [varchar] (18) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PRODUCER] [varchar] (18) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CRDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LANGUAGE] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SERVER] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PORT] [varchar] (6) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DIR] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUURL] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VODURL] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PREURL] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RATEWBT] [int] NULL ,਍ഀ
	[RATEVOD] [int] NULL ,਍ഀ
	[FRAMECNT] [int] NULL ,਍ഀ
	[ENV] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUTOR] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WARNDAYS] [int] NULL ,਍ഀ
	[STOPDAYS] [int] NULL ,਍ഀ
	[POINT] [int] NULL ,਍ഀ
	[EDULIMIT] [int] NULL ,਍ഀ
	[GRADSCORE] [decimal](3, 0) NULL ,਍ഀ
	[GRADSTEP] [int] NULL ,਍ഀ
	[WSTEP] [int] NULL ,਍ഀ
	[WMTEST] [int] NULL ,਍ഀ
	[WFTEST] [int] NULL ,਍ഀ
	[WREPORT] [int] NULL ,਍ഀ
	[WACT] [int] NULL ,਍ഀ
	[WETC1] [int] NULL ,਍ഀ
	[WETC2] [int] NULL ,਍ഀ
	[PLACE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJTARGET] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISESSENTIAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WIDTH] [int] NULL ,਍ഀ
	[HEIGHT] [int] NULL ,਍ഀ
	[EDUMANS] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTRO] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EXPLAIN] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OWNERMAN] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OWNERTEL] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](4, 1) NULL ,਍ഀ
	[FONTOBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJGUBUN] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRADREPORT] [int] NULL ,਍ഀ
	[GRADEXAM] [int] NULL ,਍ഀ
	[WHTEST] [int] NULL ,਍ഀ
	[ISOUTSOURCING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISABLEREVIEW] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKFILENAMEREAL] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKFILENAMENEW] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUPROCESS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TSUBJBUDGET] [int] NULL ,਍ഀ
	[CONTURL] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISAPPROVAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APLDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APLUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPROMOTION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MUSERTEL] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRADFTEST] [int] NULL ,਍ഀ
	[GRADHTEST] [int] NULL ,਍ഀ
	[ISVISIBLE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISALLEDU] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PLACEJH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GOYONGPRICEMAJOR] [int] NULL ,਍ഀ
	[GOYONGPRICEMINOR] [int] NULL ,਍ഀ
	[INTRODUCEFILENAMEREAL] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTRODUCEFILENAMENEW] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INFORMATIONFILENAMEREAL] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INFORMATIONFILENAMENEW] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUPERIOD] [int] NULL ,਍ഀ
	[ISINTRODUCTION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPAPPROVAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUPRICE] [int] NULL ,਍ഀ
	[CONTENTGRADE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MEMO] [varchar] (4000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISORDINARY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISWORKSHOP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUNIT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SPHERE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[prewidth] [int] NULL ,਍ഀ
	[preheight] [int] NULL ,਍ഀ
	[reviewtype] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[reviewdays] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJATT] (਍ഀ
	[SUBJCLASS] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LOWERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CLASSNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJBULLETIN] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[KIND] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REPLYGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[READCNT] [int] NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJBULLETINFILE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[KIND] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FILESEQ] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJCOUNT] (਍ഀ
	[GUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_MONTH] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_DAY] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_TIME] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DATE_WEEK] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[UPPERCLASS] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJECTDOCFILE] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[FILESEQ] [int] NOT NULL ,਍ഀ
	[REALFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJLESSON] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OWNER] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTING] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISBRANCH] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJLESSONDATE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[fromDate] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[toDate] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJLOGINID] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LGIP] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJMAN] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GADMIN] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJMODULE] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJOBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TYPE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[MODULE] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ORDERING] [int] NULL ,਍ഀ
	[SDESC] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TYPES] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTSFROMLMS] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJRELATE] (਍ഀ
	[GRCODE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[RSUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJSEQ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQGR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISBELONGCOURSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSESEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDFIRST] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDFINAL] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCLOSED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPOSETYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENTLIMIT] [int] NULL ,਍ഀ
	[POINT] [int] NULL ,਍ഀ
	[BIYONG] [int] NULL ,਍ഀ
	[ISGOYONG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDULIMIT] [int] NULL ,਍ഀ
	[ISMULTIPAPER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WARNDAYS] [int] NULL ,਍ഀ
	[STOPDAYS] [int] NULL ,਍ഀ
	[GRADSCORE] [decimal](3, 0) NULL ,਍ഀ
	[GRADSTEP] [int] NULL ,਍ഀ
	[GRADREPORT] [int] NULL ,਍ഀ
	[GRADEXAM] [int] NULL ,਍ഀ
	[WSTEP] [int] NULL ,਍ഀ
	[WMTEST] [int] NULL ,਍ഀ
	[WFTEST] [int] NULL ,਍ഀ
	[WHTEST] [int] NULL ,਍ഀ
	[WREPORT] [int] NULL ,਍ഀ
	[WACT] [int] NULL ,਍ഀ
	[WETC1] [int] NULL ,਍ഀ
	[WETC2] [int] NULL ,਍ഀ
	[ISOUTSOURCING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISABLEREVIEW] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](4, 1) NULL ,਍ഀ
	[GRADREPORTYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TSUBJBUDGET] [int] NULL ,਍ഀ
	[CPSUBJSEQ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCPRESULT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPRESULTREALFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPRESULTLDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSEBUDGET] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPRESULTNEWFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPROMOTION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISESSENTIAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRADFTEST] [int] NULL ,਍ഀ
	[GRADHTEST] [int] NULL ,਍ഀ
	[ISVISIBLE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCPFLAG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PLACE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PLACEJH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKPRICE] [int] NULL ,਍ഀ
	[SULPAPERNUM] [int] NULL ,਍ഀ
	[CANCELDAYS] [int] NULL ,਍ഀ
	[ISORDINARY] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISWORKSHOP] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUNIT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[sulpapernum2] [int] NULL ,਍ഀ
	[sulstartdate1] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[sulenddate1] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[sulstartdate2] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[sulenddate2] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUBJSEQTEMP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQGR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISBELONGCOURSE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CYEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSESEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDFIRST] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDFINAL] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCLOSED] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROPOSETYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STUDENTLIMIT] [int] NULL ,਍ഀ
	[POINT] [int] NULL ,਍ഀ
	[BIYONG] [int] NULL ,਍ഀ
	[ISGOYONG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDULIMIT] [int] NULL ,਍ഀ
	[ISMULTIPAPER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[WARNDAYS] [int] NULL ,਍ഀ
	[STOPDAYS] [int] NULL ,਍ഀ
	[GRADSCORE] [decimal](3, 0) NULL ,਍ഀ
	[GRADSTEP] [int] NULL ,਍ഀ
	[GRADREPORT] [int] NULL ,਍ഀ
	[GRADEXAM] [int] NULL ,਍ഀ
	[WSTEP] [int] NULL ,਍ഀ
	[WMTEST] [int] NULL ,਍ഀ
	[WFTEST] [int] NULL ,਍ഀ
	[WHTEST] [int] NULL ,਍ഀ
	[WREPORT] [int] NULL ,਍ഀ
	[WACT] [int] NULL ,਍ഀ
	[WETC1] [int] NULL ,਍ഀ
	[WETC2] [int] NULL ,਍ഀ
	[USESUBJSEQAPPROVAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEPROPOSEAPPROVAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEMANAGERAPPROVAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RNDCREDITREQ] [int] NULL ,਍ഀ
	[RNDCREDITCHOICE] [int] NULL ,਍ഀ
	[RNDCREDITADD] [int] NULL ,਍ഀ
	[RNDCREDITDEDUCT] [int] NULL ,਍ഀ
	[ISOUTSOURCING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISABLEREVIEW] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCORE] [decimal](4, 1) NULL ,਍ഀ
	[GRADREPORTYN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TSUBJBUDGET] [int] NULL ,਍ഀ
	[CPSUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCPRESULT] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPRESULTREALFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPRESULTLDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RNDJIJUNG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISUSEBUDGET] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CPRESULTNEWFILE] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISPROMOTION] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISESSENTIAL] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRADFTEST] [int] NULL ,਍ഀ
	[GRADHTEST] [int] NULL ,਍ഀ
	[ISVISIBLE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCPFLAG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PLACE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PLACEJH] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULNUM] [int] NOT NULL ,਍ഀ
	[DISTCODE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULTEXT] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELCOUNT] [int] NULL ,਍ഀ
	[SELMAX] [int] NULL ,਍ഀ
	[SULRETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCALECODE] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[APPTARGET] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULDISTRIB] (਍ഀ
	[DISTCODE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[DISTTEXT] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[S_GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULEACH] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULNUMS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ANSWERS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE1] [int] NULL ,਍ഀ
	[DISTCODE2] [int] NULL ,਍ഀ
	[DISTCODE3] [int] NULL ,਍ഀ
	[DISTCODE1_AVG] [decimal](5, 2) NULL ,਍ഀ
	[DISTCODE2_AVG] [decimal](5, 2) NULL ,਍ഀ
	[DISTCODE3_AVG] [decimal](5, 2) NULL ,਍ഀ
	[DISTCODE_AVG] [decimal](5, 2) NULL ,਍ഀ
	[DISTCODE] [int] NULL ,਍ഀ
	[CPSULNUMS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE4] [int] NULL ,਍ഀ
	[DISTCODE5] [int] NULL ,਍ഀ
	[DISTCODE6] [int] NULL ,਍ഀ
	[DISTCODE7] [int] NULL ,਍ഀ
	[DISTCODE4_AVG] [decimal](5, 2) NULL ,਍ഀ
	[DISTCODE5_AVG] [decimal](5, 2) NULL ,਍ഀ
	[DISTCODE6_AVG] [decimal](5, 2) NULL ,਍ഀ
	[DISTCODE7_AVG] [decimal](5, 2) NULL ,਍ഀ
	[CPSTATUS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DISTCODE10] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULMAIL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[MAILNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETURNTIME] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULMAILING] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NAME] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPANYNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPTNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIKWINM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETURN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULMEMBER] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULPAPER] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[TOTCNT] [int] NULL ,਍ഀ
	[SULNUMS] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULMAILING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULSTART] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULEND] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULPAPERNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROGRESS] [decimal](5, 2) NULL ,਍ഀ
	[CPSTATUS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULPAPERCP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[CPSEQ] [varchar] (5) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULRESULTP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULPAPERNUM] [int] NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULNUM] [int] NOT NULL ,਍ഀ
	[DISTCODE] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SULTYPE] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ANSWER] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SULSEL] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SULNUM] [int] NOT NULL ,਍ഀ
	[SELNUM] [int] NOT NULL ,਍ഀ
	[SELTEXT] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SELPOINT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_SUPERIORITY] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[LNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TITLE] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SINGLEWORD] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILE] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USEYN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LMONTH] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[comptext] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[content_text] [text] COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TAX] (਍ഀ
	[subj] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[subjseq] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[year] [int] NULL ,਍ഀ
	[grcode] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[userid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[isuseYn] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[isusedate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[post1] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[post2] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[addr1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[addr2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[gubun] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[money] [int] NULL ,਍ഀ
	[ldate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[luserid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TBUDGET] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[GUBUNCODE] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PLANDATA] [int] NULL ,਍ഀ
	[EXECDATA] [int] NULL ,਍ഀ
	[INUSERCOMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TCOMP] (਍ഀ
	[BUSINO] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[COMPNM] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[REPRESNTNM] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJCLASS] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOWERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BUSISTATUS] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BUSIITEM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL1] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL2] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TEL3] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ZIPCODE] [char] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADDR] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TEL] [varchar] (16) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FAX] [varchar] (16) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TEC_REQ] (਍ഀ
	[TECHNICAL_REQUIREMENT_IDX] [int] NOT NULL ,਍ഀ
	[REQUIREMENT_TYPE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REQUIREMENT_NAME] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MINIMUM_VERSION] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAXIMUM_VERSION] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[METADATA_IDX] [int] NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TEMPLET] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TYPE] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[IMGPATH] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAINFLASH] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUFLASH] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAINBG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOPLOGO] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOPBG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTTOPIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTBG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTBGCOLOR1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTBGCOLOR2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTCOPYRIGHT] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTLEFTIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG3] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG3] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG4] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG4] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG5] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG5] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG6] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG6] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG7] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG7] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG8] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG8] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TEMPLET_MASTER] (਍ഀ
	[TYPE] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[IMGPATH] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAINFLASH] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MENUFLASH] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAINBG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOPLOGO] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TOPBG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTTOPIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTBG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTBGCOLOR1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTBGCOLOR2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTCOPYRIGHT] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FOOTLEFTIMG] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG1] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG2] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG3] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG3] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG4] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG4] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG5] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG5] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG6] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG6] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG7] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG7] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBBG8] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBTOPIMG8] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TLESSON] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [char] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TUTORGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSONNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EDUHR] [int] NULL ,਍ഀ
	[PRICE] [int] NULL ,਍ഀ
	[GRADE] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TLESSONHST] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TUTORGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EDUTARGET] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJCLASS] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJCLASSNM] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTART] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUEND] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTS] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LESSONNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUHR] [int] NULL ,਍ഀ
	[PRICE] [int] NULL ,਍ഀ
	[GRADE] [int] NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TORON] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TPCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[REFSEQ] [int] NOT NULL ,਍ഀ
	[LEVELS] [int] NULL ,਍ഀ
	[POSITION] [int] NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[ADDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISOPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADCONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TORONTP] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TPCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[ADDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[F_OPEN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[STARTED] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ENDED] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JOINNUM] [int] NULL ,਍ഀ
	[UPDAY] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADCONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TSUBJ] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJNM] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EDUGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[EDUSTARTA] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUENDA] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUTARGETA] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUTMEMA] [int] NULL ,਍ഀ
	[EDUTSEQA] [int] NULL ,਍ഀ
	[SEQPERMEMA] [int] NULL ,਍ഀ
	[EDUPLACEA] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUSTARTB] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUENDB] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUTARGETB] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EDUTMEMB] [int] NULL ,਍ഀ
	[EDUTSEQB] [int] NULL ,਍ഀ
	[SEQPERMEMB] [int] NULL ,਍ഀ
	[EDUPLACEB] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GYAMT] [int] NULL ,਍ഀ
	[COMMENTS] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFILE] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SAVEFILE] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SATISFACTION] [int] NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INUSERCOMP] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [char] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJLMS] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TUTOR] (਍ഀ
	[USERID] [varchar] (13) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[NAME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEX] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST1] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[POST2] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADD1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ADD2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PHONE] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[HANDPHONE] [varchar] (18) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FAX] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMPCD] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMP] [varchar] (60) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DEPT] [varchar] (60) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[JIK] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ACADEMIC] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAJOR] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISADD] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISCYBER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISGUBUN] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISGUBUNTYPE] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISSTATUS] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISTUTOR] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CAREERYEAR] [int] NULL ,਍ഀ
	[LICENSE] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CAREER] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOK] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PROFESSIONAL] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CHARGE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISINFO] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ETC] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PHOTO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NEWPHOTO] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PHOTOTERMS] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RESNO] [varchar] (13) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPPERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MIDDLECLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOWERCLASS] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJCLASS] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUTORGUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAJORBOOK] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INTRO] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISMANAGER] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TUTORGRADE] (਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[INWON] [int] NULL ,਍ഀ
	[INWONGRADE] [int] NULL ,਍ഀ
	[SAPOINT] [int] NULL ,਍ഀ
	[SAGRADE] [int] NULL ,਍ഀ
	[JOINGRADE] [int] NULL ,਍ഀ
	[MALEVEL] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MAGRADE] [int] NULL ,਍ഀ
	[JIGUB1] [int] NULL ,਍ഀ
	[JIGUB2] [int] NULL ,਍ഀ
	[FJIGUB] [int] NULL ,਍ഀ
	[JIGUBFEE] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[REALFEE] [int] NULL ,਍ഀ
	[JOINPOINT] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TUTORLOG] (਍ഀ
	[TUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SERNO] [int] NOT NULL ,਍ഀ
	[LOGIN] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LOGOUT] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LOGINIP] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DTIME] [int] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TUTORMEASURE] (਍ഀ
	[GUBUN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[VALUE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TPCODE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TUTORMESSAGE] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TITLE] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENT] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[INDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CNT] [int] NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_TUTORPAY] (਍ഀ
	[TUTORCODE] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[PRICE] [int] NOT NULL ,਍ഀ
	[ADDPRICE] [int] NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_USERMAIL] (਍ഀ
	[SEQ] [int] NOT NULL ,਍ഀ
	[TITLE] [varchar] (110) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FUSERID] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FUSERNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[FUSEREMAIL] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUSERID] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUSERNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[TUSEREMAIL] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CONTENTS] [text] COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RETMAILING] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_USER_SCOINFO] (਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LESSON] [varchar] (3) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[OID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CORE_LESSON_LOCATION] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_CREDIT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_LESSON_STATUS] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_ENTRY] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_SCORE_RAW] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_SCORE_MAX] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_SCORE_MIN] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_TOTAL_TIME] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_LESSON_MODE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_EXIT] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CORE_SESSION_TIME] [varchar] (15) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUSPEND_DATA] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COMMENTS] [varchar] (1000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_WORKPLC] (਍ഀ
	[GRPCOMP] [varchar] (4) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[WORK_PLC] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[WORK_PLCNM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[LUSERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[TZ_ZIPCODE] (਍ഀ
	[SEQ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ZIPCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SIDO] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[GUGUN] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DONG] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BUNJI] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[USR_DLT] (਍ഀ
	[USRCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USRENAM] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRHPOST] [char] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRHADDR] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRHADR2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USROPOST] [char] (7) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USROADDR] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USROADR2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRHTEL] [varchar] (25) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USROTEL] [varchar] (25) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRHNDP] [varchar] (25) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRFAXT] [varchar] (25) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CMPNAME] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRDEPT] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRPSTN] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRJOB] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USRREGDT] [datetime] NOT NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ,਍ഀ
	[GRADE] [varchar] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SCHOLAR] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[HISTORY] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DESIRE] [varchar] (2000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[USR_MST] (਍ഀ
	[USRCODE] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USRPWD] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USRNAME] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CMPCODE] [varchar] (9) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USRJUMN] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRMAIL] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[USRKIND] [varchar] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ISOPNFLG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISDLTFLG] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ISMALFLG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[ISNWSFLG] [char] (1) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_ID] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UPDATE_DT] [datetime] NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[tbContentData] (਍ഀ
	[data_idx] [int] NOT NULL ,਍ഀ
	[serial] [int] NOT NULL ,਍ഀ
	[content] [varchar] (8000) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[tbSearchData] (਍ഀ
	[idx] [int] NOT NULL ,਍ഀ
	[coursecode] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[title] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[url] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[tz_basket] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [numeric](3, 0) NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSEYEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSESEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UNIT] [numeric](3, 0) NOT NULL ,਍ഀ
	[PRICE] [numeric](10, 0) NOT NULL ,਍ഀ
	[AMOUNT] [numeric](10, 0) NOT NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[tz_basketbill] (਍ഀ
	[GRCODE] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[TID] [varchar] (40) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[USERID] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [numeric](3, 0) NOT NULL ,਍ഀ
	[GUBUN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SUBJ] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[YEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[SUBJSEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSE] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSEYEAR] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[COURSESEQ] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[BOOKCODE] [varchar] (4) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[UNIT] [numeric](3, 0) NOT NULL ,਍ഀ
	[PRICE] [numeric](10, 0) NOT NULL ,਍ഀ
	[AMOUNT] [numeric](10, 0) NOT NULL ,਍ഀ
	[LDATE] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[tz_billcancel] (਍ഀ
	[TID] [varchar] (40) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[SEQ] [numeric](3, 0) NOT NULL ,਍ഀ
	[MID] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[ResultMsg] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CancelYN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CancelResult] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CancelDate] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CancelTime] [varchar] (6) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RcashCancelNo] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[Luserid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[Ldate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
CREATE TABLE [dbo].[tz_billinfo] (਍ഀ
	[grcode] [varchar] (7) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[tid] [varchar] (40) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[gubun] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[resultcode] [varchar] (2) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[resultmsg] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[paymethod] [varchar] (12) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[mid] [varchar] (10) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[goodname] [varchar] (80) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[userid] [varchar] (15) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[usernm] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[price] [numeric](12, 0) NOT NULL ,਍ഀ
	[point] [numeric](10, 0) NOT NULL ,਍ഀ
	[buyername] [varchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[buyertel] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[buyeremail] [varchar] (60) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[resulterrcode] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[price1] [numeric](12, 0) NULL ,਍ഀ
	[price2] [numeric](12, 0) NULL ,਍ഀ
	[AuthCode] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CardQuota] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[QuotaInterest] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CardCode] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CardIssuerCode] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[AuthCertain] [varchar] (5) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PgAuthDate] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PgAuthTime] [char] (6) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OcbSaveAuthCode] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OcbUseAuthCode] [varchar] (12) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OcbAuthDate] [char] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[EventFlag] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[PerNo] [varchar] (14) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[Vacct] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[VcdBank] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[DtInput] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NmInput] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[NmVacct] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[MoID] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[OcbCardnumber] [varchar] (16) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[Cardnumber] [varchar] (16) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CancelYN] [char] (1) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[CancelResult] [varchar] (2) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CancelDate] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[CancelTime] [varchar] (6) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[RcashCancelNo] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[inputname] [varchar] (40) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[inputdate] [varchar] (8) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[Luserid] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[Ldate] [varchar] (14) COLLATE Korean_Wansung_CI_AS NOT NULL ,਍ഀ
	[receive] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[phone] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[post1] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[post2] [varchar] (3) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[addr1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,਍ഀ
	[addr2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ਍ഀ
) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ADMINMENUAUTH] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ADMINMENUAUTH] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[MENU],਍ഀ
		[MENUSUBSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BDS] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BDS] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BETACPINFO] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BETACPINFO] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[BETASEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BETAMFSUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BETAMFSUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[MENU],਍ഀ
		[MENUNM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BOARD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BOARD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BOARDFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BOARDFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ],਍ഀ
		[SEQ],਍ഀ
		[FILESEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BOOK] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BOOK] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[BOOKCODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BOOKSELL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BOOKSELL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[seq]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BULLETIN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BULLETIN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BULLETINFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_BULLETINFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ],਍ഀ
		[FILESEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CANCEL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CANCEL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CLASS] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CLASS] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[CLASS]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CLASSFYMATCH] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CLASSFYMATCH] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[MATCHCODE],਍ഀ
		[UPPERCLASS]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CLASSIF] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CLASSIF] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CLASSIFICATION_IDX],਍ഀ
		[METADATA_IDX]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CLASSTUTOR] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CLASSTUTOR] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[CLASS],਍ഀ
		[TUSERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUALBUM] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUALBUM] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[ALBUMNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUALBUMREPLY] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUALBUMREPLY] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[ALBUMNO],਍ഀ
		[RPLNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUALDIRECT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUALDIRECT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[DIRECTNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUALDIRECTFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUALDIRECTFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[DIRECTNO],਍ഀ
		[FILENO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUALDIRECTREPLAY] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUALDIRECTREPLAY] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[DIRECTNO],਍ഀ
		[RPLNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUBASEMST] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUBASEMST] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[CMU_NM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUBOARD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUBOARD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[MENUNO],਍ഀ
		[BRDNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUBOARDFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUBOARDFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[MENUNO],਍ഀ
		[BRDNO],਍ഀ
		[FILENO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUFAQ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUFAQ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[FAQ_TYPE],਍ഀ
		[FAQNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUFAQFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUFAQFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[FAQ_TYPE],਍ഀ
		[FAQNO],਍ഀ
		[FILENO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUFAQREPLAY] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUFAQREPLAY] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[FAQ_TYPE],਍ഀ
		[FAQNO],਍ഀ
		[RPLNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUGRDCODE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUGRDCODE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[GRCODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUHONGBO] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUHONGBO] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUMAIL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUMAIL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[MAILNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUMENULIMIT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUMENULIMIT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[MENUNO],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUPOLICE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUPOLICE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[POLICENO],਍ഀ
		[CMUNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUPOLLFIELD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUPOLLFIELD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[POLLNO],਍ഀ
		[QUESTNO],਍ഀ
		[FIELDNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUPOLLMST] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUPOLLMST] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[POLLNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUPOLLQUEST] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUPOLLQUEST] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[POLLNO],਍ഀ
		[QUESTNO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUPOLLTICKET] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUPOLLTICKET] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[POLLNO],਍ഀ
		[QUESTNO],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CMUUSERMST] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CMUUSERMST] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CMUNO],਍ഀ
		[USERID],਍ഀ
		[KOR_NAME]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CODEGUBUN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CODEGUBUN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GUBUN]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COMMENTQNA] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COMMENTQNA] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ],਍ഀ
		[SEQ],਍ഀ
		[COMMENTSEQ],਍ഀ
		[TYPES]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COMMUNITY] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COMMUNITY] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COMMID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COMMUNITY_NOTICE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COMMUNITY_NOTICE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COMMID],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COMP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COMP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COMP]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COMPCLASS] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COMPCLASS] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COMP]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COMPCONDITION] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COMPCONDITION] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COMP],਍ഀ
		[DUTY]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COMPMAN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COMPMAN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID],਍ഀ
		[COMP]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONFIG] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONFIG] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[NAME]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONLEARNMARK] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONLEARNMARK] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID],਍ഀ
		[CHAPID],਍ഀ
		[CLAUID],਍ഀ
		[ITEM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONNICK] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONNICK] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[NICK_IDX]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONQUIZ_OX] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONQUIZ_OX] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[QUIZ_NUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONSEXUAL_TABLE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONSEXUAL_TABLE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTACT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTACT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTBCHAPTER1] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTBCHAPTER1] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTBCHAPTER2] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTBCHAPTER2] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTBCHAPTER3] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTBCHAPTER3] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[NUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTBCHAPTER4] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTBCHAPTER4] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[NUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTBLANSWER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTBLANSWER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[NO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTBLNETRO] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTBLNETRO] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTCHAPTER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTCHAPTER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CHAPID],਍ഀ
		[CURRCD]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CONTCLAUSE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CONTCLAUSE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CHAPID],਍ഀ
		[CLAUID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COPREP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COPREP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[ORDSEQ],਍ഀ
		[USERID],਍ഀ
		[SEQ],਍ഀ
		[COUSERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CORRECTION] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CORRECTION] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ],਍ഀ
		[SUBJ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COURSE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COURSE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COURSE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COURSEMAP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COURSEMAP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COURSESEQ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COURSESEQ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COURSE],਍ഀ
		[CYEAR],਍ഀ
		[COURSESEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COURSESTOLD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COURSESTOLD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COURSE],਍ഀ
		[CYEAR],਍ഀ
		[COURSESEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COURSESUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_COURSESUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[COURSE],਍ഀ
		[SUBJ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CPINFO] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CPINFO] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CPSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CPPARAM] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CPPARAM] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_CPUPDATESTATUS] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_CPUPDATESTATUS] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_DATABOARD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_DATABOARD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_DIC] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_DIC] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GUBUN],਍ഀ
		[SUBJ],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_DICGROUP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_DICGROUP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GROUPS]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_EDUTARGET] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_EDUTARGET] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[MASTERCD],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ETEST] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ETEST] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[ETESTSUBJ],਍ഀ
		[ETESTNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ETESTMASTER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ETESTMASTER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[ETESTSUBJ],਍ഀ
		[ETESTCODE],਍ഀ
		[YEAR]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ETESTMEMBER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ETESTMEMBER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[ETESTSUBJ],਍ഀ
		[ETESTCODE],਍ഀ
		[YEAR],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ETESTPAPER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ETESTPAPER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[ETESTSUBJ],਍ഀ
		[ETESTCODE],਍ഀ
		[YEAR],਍ഀ
		[ETESTNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ETESTRESULT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ETESTRESULT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[ETESTSUBJ],਍ഀ
		[ETESTCODE],਍ഀ
		[YEAR],਍ഀ
		[ETESTNUM],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ETESTSEL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ETESTSEL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[ETESTSUBJ],਍ഀ
		[ETESTNUM],਍ഀ
		[SELNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ETESTSUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ETESTSUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[ETESTSUBJ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_EXAM] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_EXAM] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[EXAMNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_EXAMRESULT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_EXAMRESULT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[LESSON],਍ഀ
		[EXAMTYPE],਍ഀ
		[PAPERNUM],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_EXAMSEL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_EXAMSEL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[EXAMNUM],਍ഀ
		[SELNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_FAQ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_FAQ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[FAQCATEGORY],਍ഀ
		[FNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_FAQ_CATEGORY] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_FAQ_CATEGORY] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[FAQCATEGORY]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GADMIN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GADMIN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GADMIN]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GONG] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GONG] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GONGSAMPLE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GONGSAMPLE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TYPES],਍ഀ
		[GUBUN]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GRCODE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GRCODE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GRCODEMAN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GRCODEMAN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID],਍ഀ
		[GADMIN],਍ഀ
		[GRCODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GRCOMP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GRCOMP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[COMP]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GRRECOM] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GRRECOM] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SUBJCOURSE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GRSEQ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GRSEQ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[GYEAR],਍ഀ
		[GRSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GRSUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_GRSUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SUBJCOURSE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_HOMECOUNT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_HOMECOUNT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GUBUN],਍ഀ
		[DATE_YEAR],਍ഀ
		[DATE_MONTH],਍ഀ
		[DATE_DAY],਍ഀ
		[DATE_TIME],਍ഀ
		[DATE_WEEK]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_HOMEFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_HOMEFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ],਍ഀ
		[SEQ],਍ഀ
		[TYPES],਍ഀ
		[FILESEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_HOMEMENU] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_HOMEMENU] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[GUBUN],਍ഀ
		[MENUID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_HOMEMENU_MASTER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_HOMEMENU_MASTER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRTYPE],਍ഀ
		[GUBUN],਍ഀ
		[MENUID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_HOMEQNA] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_HOMEQNA] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ],਍ഀ
		[SEQ],਍ഀ
		[TYPES]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_KNOWCODE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_KNOWCODE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SUBJCLASS]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_LINKSITE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_LINKSITE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MANAGER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MANAGER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID],਍ഀ
		[GADMIN]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MASTERCD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MASTERCD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[GYEAR],਍ഀ
		[GRSEQ],਍ഀ
		[MASTERCD]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MEMBER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MEMBER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MENU] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MENU] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[MENU]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MENUAUTH] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MENUAUTH] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[MENU],਍ഀ
		[MENUSUBSEQ],਍ഀ
		[GADMIN]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MENUCOUNT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MENUCOUNT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[GUBUN],਍ഀ
		[MENUID],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MENUSUB] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MENUSUB] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[MENU],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MENUSUBPROCESS] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MENUSUBPROCESS] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[MENU],਍ഀ
		[SEQ],਍ഀ
		[PROCESS]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MFMENU] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MFMENU] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[MENU],਍ഀ
		[MENUNM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MFSUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_MFSUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[MENU],਍ഀ
		[MENUNM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_NOTICE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_NOTICE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TABSEQ],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_NOTICE_TEMPLET] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_NOTICE_TEMPLET] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OBJATT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OBJATT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[OID],਍ഀ
		[ATT]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OBJECT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OBJECT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[OID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OFFGALLERY] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OFFGALLERY] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[seq]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OFFLINEPROPOSE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OFFLINEPROPOSE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[seq],਍ഀ
		[grcode],਍ഀ
		[userid]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OFFLINESUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OFFLINESUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[seq]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OFFSUBJLECTURE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OFFSUBJLECTURE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[LECTURE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OPENFORUM] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OPENFORUM] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SEQ],਍ഀ
		[TYPES]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OPENFORUMCOMMENT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OPENFORUMCOMMENT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SEQ],਍ഀ
		[COMMENTSEQ],਍ഀ
		[TYPES]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OPENFORUMSUBJECT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OPENFORUMSUBJECT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SUBJECTSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_OUTMEMBER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_OUTMEMBER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_POINTITEM] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_POINTITEM] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[CODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_POLL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_POLL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_POLLLOG] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_POLLLOG] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_POLLSEL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_POLLSEL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ],਍ഀ
		[SELNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_POSTSCRIPT] WITH NOCHECK ADD ਍ഀ
	 PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PRECOURSE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PRECOURSE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PREVIEW] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PREVIEW] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[SUBJ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PREVIEWOBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PREVIEWOBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[OID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PREVIEW_LOG] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PREVIEW_LOG] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PROGRESS] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PROGRESS] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[LESSON],਍ഀ
		[OID],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PROJASSIGN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PROJASSIGN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[ORDSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PROJGRP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PROJGRP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[ORDSEQ],਍ഀ
		[USERID],਍ഀ
		[PROJGRP]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PROJORD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PROJORD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[ORDSEQ],਍ഀ
		[PROJSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PROJREP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PROJREP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[ORDSEQ],਍ഀ
		[PROJID],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PROPOSE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_PROPOSE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_QNA] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_QNA] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[LESSON],਍ഀ
		[SEQ],਍ഀ
		[KIND]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_QNAFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_QNAFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[LESSON],਍ഀ
		[SEQ],਍ഀ
		[KIND],਍ഀ
		[FILESEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SANGDAM] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SANGDAM] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[NO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SCALE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SCALE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SCALECODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SCALESEL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SCALESEL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SCALECODE],਍ഀ
		[SELNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_STOLD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_STOLD] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_STOLDHST] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_STOLDHST] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_STUDENT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_STUDENT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_STUDENTREJECT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_STUDENTREJECT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_STUDYCONTROL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_STUDYCONTROL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJATT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJATT] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJCLASS]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJBULLETIN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJBULLETIN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[GUBUN],਍ഀ
		[SEQ],਍ഀ
		[KIND]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJBULLETINFILE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJBULLETINFILE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[GUBUN],਍ഀ
		[SEQ],਍ഀ
		[KIND],਍ഀ
		[FILESEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJLESSON] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJLESSON] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[MODULE],਍ഀ
		[LESSON]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJLESSONDATE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJLESSONDATE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[MODULE],਍ഀ
		[LESSON]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJMAN] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJMAN] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID],਍ഀ
		[GADMIN],਍ഀ
		[SUBJ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJMODULE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJMODULE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[MODULE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJOBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJOBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[TYPE],਍ഀ
		[MODULE],਍ഀ
		[LESSON],਍ഀ
		[OID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJSEQ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUBJSEQ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SUL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[GRCODE],਍ഀ
		[SULNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SULDISTRIB] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SULDISTRIB] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[DISTCODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SULEACH] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SULEACH] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[GRCODE],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[SULPAPERNUM],਍ഀ
		[USERID],਍ഀ
		[GUBUN]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SULMAILING] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SULMAILING] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[GRCODE],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[SULPAPERNUM],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SULMEMBER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SULMEMBER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[GRCODE],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[SULPAPERNUM],਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SULPAPER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SULPAPER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[GRCODE],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[SULPAPERNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SULRESULTP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SULRESULTP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[GUBUN],਍ഀ
		[GRCODE],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[SULPAPERNUM],਍ഀ
		[USERID],਍ഀ
		[SULNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SULSEL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_SULSEL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[GRCODE],਍ഀ
		[SULNUM],਍ഀ
		[SELNUM]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TCOMP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TCOMP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[BUSINO]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TEMPLET] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TEMPLET] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[TYPE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TEMPLET_MASTER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TEMPLET_MASTER] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TYPE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TORON] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TORON] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[TPCODE],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TORONTP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TORONTP] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ],਍ഀ
		[TPCODE]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TSUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TSUBJ] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SUBJ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TUTOR] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TUTOR] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TUTORGRADE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TUTORGRADE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID],਍ഀ
		[SUBJ],਍ഀ
		[YEAR],਍ഀ
		[SUBJSEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TUTORMEASURE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_TUTORMEASURE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GUBUN]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TUTORMESSAGE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [event_key] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[USERID],਍ഀ
		[SUBJ],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_ZIPCODE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_TZ_ZIPCODE] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[tbContentData] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_tbContentData] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[data_idx],਍ഀ
		[serial]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[tbSearchData] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_tbSearchData] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[idx]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[tz_basket] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PZ_BASKET] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[USERID],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[tz_basketbill] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PZ_BASKETBILL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[GRCODE],਍ഀ
		[TID],਍ഀ
		[USERID],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[tz_billcancel] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_BILLCANCEL] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[TID],਍ഀ
		[SEQ]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[tz_billinfo] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [PK_BILLINFO] PRIMARY KEY  CLUSTERED ਍ഀ
	(਍ഀ
		[grcode],਍ഀ
		[tid]਍ഀ
	)  ON [PRIMARY] ਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TY_COMMON_ACT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF__TY_COMMON__INPUT__2215F810] DEFAULT (null) FOR [INPUT01],਍ഀ
	CONSTRAINT [DF__TY_COMMON__INPUT__230A1C49] DEFAULT (null) FOR [INPUT02],਍ഀ
	CONSTRAINT [DF__TY_COMMON__LRESN__23FE4082] DEFAULT (null) FOR [LRESNO],਍ഀ
	CONSTRAINT [DF__TY_COMMON__LDATE__24F264BB] DEFAULT (null) FOR [LDATE]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BOOK] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_BOOK_PRICE] DEFAULT (0) FOR [PRICE],਍ഀ
	CONSTRAINT [DF_TZ_BOOK_DIS_PRICE] DEFAULT (0) FOR [DIS_PRICE],਍ഀ
	CONSTRAINT [DF_TZ_BOOK_RECOM] DEFAULT ('N') FOR [RECOM],਍ഀ
	CONSTRAINT [DF_TZ_BOOK_ISCANCEL] DEFAULT ('N') FOR [ISCANCEL]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_BOOKSELL] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_BOOKSELL_dis_price] DEFAULT (0) FOR [dis_price],਍ഀ
	CONSTRAINT [DF_TZ_BOOKSELL_isCancel] DEFAULT ('N') FOR [isCancel],਍ഀ
	CONSTRAINT [DF_TZ_BOOKSELL_refundmoney] DEFAULT (0) FOR [refundmoney]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_COURSESEQ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_COURSESEQ_isclosed] DEFAULT ('N') FOR [ISCLOSED],਍ഀ
	CONSTRAINT [DF_TZ_COURSESEQ_canceldays] DEFAULT ('0') FOR [canceldays]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_DISCOUNT] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_DISCOUNT_DISCOUNT] DEFAULT (0) FOR [DISCOUNT]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_GRSUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_GRSUBJ_ISCOURSE] DEFAULT ('N') FOR [ISCOURSE]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_MEMBER] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_ISMAILING] DEFAULT ('N') FOR [ISMAILING],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_ISLETTERING] DEFAULT ('N') FOR [ISLETTERING],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_ISOPENING] DEFAULT ('N') FOR [ISOPENING],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_MEBERGUBUN] DEFAULT ('P') FOR [MEMBERGUBUN],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_STATE] DEFAULT ('N') FOR [STATE],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_VALIDATION] DEFAULT (0) FOR [VALIDATION],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_LGCNT] DEFAULT (0) FOR [LGCNT],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_LGFAIL] DEFAULT (0) FOR [LGFAIL],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_KOCCASUPERYN] DEFAULT ('N') FOR [KOCCASUPERYN],਍ഀ
	CONSTRAINT [DF_TZ_MEMBER_GAMESUPERYN] DEFAULT ('N') FOR [GAMESUPERYN]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_PROJREP] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_PROJREP_ISFINAL] DEFAULT ('N') FOR [ISFINAL]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_STOLD] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF_TZ_STOLD_ISOLD] DEFAULT ('N') FOR [ISOLD]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF__tz_subj__prewidt__10EB6C0E] DEFAULT (0) FOR [prewidth],਍ഀ
	CONSTRAINT [DF__tz_subj__preheig__11DF9047] DEFAULT (0) FOR [preheight],਍ഀ
	CONSTRAINT [DF__tz_subj__reviewt__12D3B480] DEFAULT ('D') FOR [reviewtype],਍ഀ
	CONSTRAINT [DF__tz_subj__reviewd__13C7D8B9] DEFAULT (0) FOR [reviewdays]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_SUBJSEQ] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF__tz_subjse__sulst__039170F0] DEFAULT ('') FOR [sulstartdate1],਍ഀ
	CONSTRAINT [DF__tz_subjse__sulen__04859529] DEFAULT ('') FOR [sulenddate1],਍ഀ
	CONSTRAINT [DF__tz_subjse__sulst__0579B962] DEFAULT ('') FOR [sulstartdate2],਍ഀ
	CONSTRAINT [DF__tz_subjse__sulen__066DDD9B] DEFAULT ('') FOR [sulenddate2]਍ഀ
GO਍ഀ
਍ഀ
ALTER TABLE [dbo].[TZ_TUTORMESSAGE] WITH NOCHECK ADD ਍ഀ
	CONSTRAINT [DF__TZ_TUTORMES__CNT__672A3C6C] DEFAULT (0) FOR [CNT]਍ഀ
GO਍ഀ
਍ഀ
 CREATE  UNIQUE  INDEX [TY_COMMON_ACT_PK] ON [dbo].[TY_COMMON_ACT]([SUBJ], [YEAR], [SUBJSEQ], [DATES], [SEQ], [SUBSEQ], [GUBUN], [RESNO]) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
 CREATE  INDEX [TZ_POSTSCRIPT_IDX1] ON [dbo].[TZ_POSTSCRIPT]([GRCODE], [USERID]) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
 CREATE  INDEX [TZ_POSTSCRIPT_IDX2] ON [dbo].[TZ_POSTSCRIPT]([GRCODE], [SUBJ]) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
 CREATE  INDEX [TZ_POSTSCRIPT_IDX3] ON [dbo].[TZ_POSTSCRIPT]([GRCODE], [SUBJ], [USERID]) ON [PRIMARY]਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
CREATE  VIEW dbo.VZ_MEMBER਍ഀ
(਍ഀ
	USERID, RESNO, PWD, NAME, EMAIL, ਍ഀ
	 CONO, POST1, POST2, ADDR, HOMETEL, ਍ഀ
	 HANDPHONE, COMPTEL, TEL_LINE, COMP, INDATE, ਍ഀ
	 LGCNT, LGLAST, LGIP, JIKUP, JIKUPNM, ਍ഀ
	 JIKWI, JIKWINM, OFFICE_GBN, OFFICE_GBNNM, WORK_PLC, ਍ഀ
	 WORK_PLCNM, DEPTCOD, DEPTNAM, LDATE, LGFIRST਍ഀ
)਍ഀ
AS ਍ഀ
(਍ഀ
	select਍ഀ
		userid      ,਍ഀ
		resno       ,਍ഀ
		pwd         ,਍ഀ
		name        ,਍ഀ
		email       ,਍ഀ
		cono        ,਍ഀ
		post1       ,਍ഀ
		post2       ,਍ഀ
		addr        ,਍ഀ
		hometel     ,਍ഀ
		handphone   ,਍ഀ
		comptel     ,਍ഀ
		tel_line    ,਍ഀ
		comp        ,਍ഀ
		indate      ,਍ഀ
		lgcnt       ,਍ഀ
		lglast      ,਍ഀ
		lgip        ,਍ഀ
		jikup       ,਍ഀ
		jikupnm     ,਍ഀ
		jikwi       ,਍ഀ
		jikwinm     ,਍ഀ
		office_gbn  ,਍ഀ
		office_gbnnm,਍ഀ
		work_plc    ,਍ഀ
		work_plcnm  ,਍ഀ
		deptcod     ,਍ഀ
		deptnam     ,਍ഀ
		ldate       ,਍ഀ
		lgfirst     ਍ഀ
	from਍ഀ
	  	TZ_MEMBER਍ഀ
	)਍ഀ
	UNION਍ഀ
	(਍ഀ
	select਍ഀ
		  userid      ,਍ഀ
		  resno       ,਍ഀ
		  pwd         ,਍ഀ
		  name        ,਍ഀ
		  email       ,਍ഀ
		  cono        ,਍ഀ
		  post1       ,਍ഀ
		  post2       ,਍ഀ
		  addr        ,਍ഀ
		  hometel     ,਍ഀ
		  handphone   ,਍ഀ
		  comptel     ,਍ഀ
		  tel_line    ,਍ഀ
		  comp        ,਍ഀ
		  indate      ,਍ഀ
		  lgcnt       ,਍ഀ
		  lglast      ,਍ഀ
		  lgip        ,਍ഀ
		  jikup       ,਍ഀ
		  jikupnm     ,਍ഀ
		  jikwi       ,਍ഀ
		  jikwinm     ,਍ഀ
		  office_gbn  ,਍ഀ
		  office_gbnnm,਍ഀ
		  work_plc    ,਍ഀ
		  work_plcnm  ,਍ഀ
		  deptcod     ,਍ഀ
		  deptnam     ,਍ഀ
		  ldate       ,਍ഀ
		  lgfirst     ਍ഀ
	from਍ഀ
	  	TZ_OUTMEMBER਍ഀ
	)਍ഀ
--WITH READ ONLY;਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
CREATE             VIEW dbo.VZ_SCSUBJSEQ਍ഀ
(਍ഀ
	SCSUBJ, SCYEAR, SCSUBJSEQ, SCSUBJNM, SCUPPERCLASS, ਍ഀ
	SCMIDDLECLASS, SCLOWERCLASS, SCSUBJCLASS, SUBJ, YEAR, ਍ഀ
	SUBJSEQ, GRCODE, GYEAR, GRSEQ, SUBJSEQGR, ਍ഀ
	ISBELONGCOURSE, COURSE, CYEAR, COURSESEQ, PROPSTART, ਍ഀ
	PROPEND, EDUSTART, EDUEND, ISCLOSED, SUBJNM, ਍ഀ
	STUDENTLIMIT, POINT, BIYONG, SCBIYONG, ISGOYONG, EDULIMIT, ਍ഀ
	ISMULTIPAPER, WARNDAYS, STOPDAYS, SGRADSCORE, GRADSTEP, ਍ഀ
	WSTEP, WMTEST, WFTEST, WHTEST, WREPORT, ਍ഀ
	WACT, WETC1, WETC2, ENDFIRST, ENDFINAL, ਍ഀ
	COURSENM, SCPROPSTART, SCPROPEND, SCEDUSTART, SCEDUEND, ਍ഀ
	CGRADSCORE, CGRADFAILCNT, ISONOFF, ਍ഀ
	PROPOSETYPE, PLACE, PREURL, ISUSE, ISPROPOSE, ਍ഀ
	EDUURL, SUBJTARGET, EDUDAYS, EDUTIMES, OWNER, ਍ഀ
	OWNERMAN, OWNERTEL, ISOUTSOURCING, CONTENTTYPE, GOYONGPRICE, ਍ഀ
	SPECIALS, OFFGUBUN, SEQVISIBLE, SUBJVISIBLE, CPSUBJSEQ, ਍ഀ
	CPSUBJ, ISABLEREVIEW, ISCPRESULT, ISCPFLAG, ISALLEDU, ਍ഀ
	CANCELDAYS,  USEBOOK, 	 MEMO, 	BOOKPRICE, ISORDINARY, ISWORKSHOP , ISUNIT,EDUPERIOD, SUBJCNT, REVIEWDAYS, REVIEWTYPE਍ഀ
)਍ഀ
AS ਍ഀ
	select ਍ഀ
		CASE When a.course = '000000' Then a.subj  Else a.course End  as scsubj,਍ഀ
		CASE  When a.course = '000000' Then a.year  Else a.cyear End  as scyear,਍ഀ
		CASE When a.course = '000000' Then a.subjseq  Else a.courseseq End  as scsubjseq,਍ഀ
		CASE When a.course = '000000' Then a.subjnm  Else b.coursenm End as scsubjnm,਍ഀ
		CASE  When a.course = '000000' Then  c.upperclass  Else (select upperclass from tz_course where course= a.course)  End  as scupperclass,਍ഀ
		CASE  When a.course = '000000' Then c.middleclass  Else (select middleclass from tz_course where course= a.course)   End  as scmiddleclass,਍ഀ
		CASE  When a.course = '000000' Then  c.lowerclass  Else (select lowerclass from tz_course where course= a.course)   End  as sclowerclass,਍ഀ
		CASE  When a.course = '000000' Then c.subjclass    Else  (select courseclass from tz_course where course= a.course)   End  as scsubjclass,਍ഀ
		a.subj, ਍ഀ
		a.year, ਍ഀ
		a.subjseq, ਍ഀ
		a.grcode, ਍ഀ
		a.gyear, ਍ഀ
		a.grseq, ਍ഀ
		a.subjseqgr, ਍ഀ
		a.isbelongcourse, ਍ഀ
		a.course, ਍ഀ
		a.cyear, ਍ഀ
		a.courseseq, ਍ഀ
		a.propstart, ਍ഀ
		a.propend, ਍ഀ
		a.edustart, ਍ഀ
		a.eduend, ਍ഀ
		a.isclosed, ਍ഀ
		a.subjnm, ਍ഀ
		a.studentlimit, ਍ഀ
		a.point, ਍ഀ
		a.biyong, ਍ഀ
		CASE When a.course = '000000' Then a.biyong  Else b.biyong End  as scbiyong,਍ഀ
		a.isgoyong, ਍ഀ
		a.edulimit, ਍ഀ
		a.ismultipaper, ਍ഀ
		a.warndays, ਍ഀ
		a.stopdays, ਍ഀ
		a.gradscore, ਍ഀ
		a.gradstep, ਍ഀ
		a.wstep, ਍ഀ
		a.wmtest, ਍ഀ
		a.wftest, ਍ഀ
		a.whtest, ਍ഀ
		a.wreport, ਍ഀ
		a.wact, ਍ഀ
		a.wetc1, ਍ഀ
		a.wetc2, ਍ഀ
		a.endfirst, ਍ഀ
		a.endfinal, ਍ഀ
		CASE  When a.course = '000000' Then '' Else b.coursenm End  as coursenm,਍ഀ
		CASE  When a.course = '000000' Then a.propstart Else b.propstart  End  as scpropstart,਍ഀ
		CASE  When a.course = '000000' Then a.propend  Else b.propend   End  as scpropend,਍ഀ
		CASE  When a.course = '000000' Then a.edustart  Else b.edustart    End  as scedustar,਍ഀ
		CASE  When a.course = '000000' Then a.eduend   Else b.eduend    End  as sceduend,਍ഀ
		b.gradscore, ਍ഀ
		b.gradfailcnt, ਍ഀ
		c.isonoff, ਍ഀ
		a.proposetype, ਍ഀ
		a.place, ਍ഀ
		c.preurl, ਍ഀ
		c.isuse, ਍ഀ
		c.ispropose, ਍ഀ
		C.eduurl, ਍ഀ
		C.subjtarget, ਍ഀ
		C.edudays, ਍ഀ
		C.edutimes, ਍ഀ
		C.owner, ਍ഀ
		C.ownerman, ਍ഀ
		C.ownertel, ਍ഀ
		C.isoutsourcing, ਍ഀ
		c.contenttype, ਍ഀ
		c.goyongprice, ਍ഀ
		c.specials, ਍ഀ
		'' AS offgubun, ਍ഀ
		a.isvisible AS seqvisible, ਍ഀ
		c.isvisible AS subjvisible, ਍ഀ
		a.cpsubjseq, ਍ഀ
		c.cpsubj, ਍ഀ
		c.isablereview, ਍ഀ
		a.iscpresult, ਍ഀ
		a.iscpflag, ਍ഀ
		c.isalledu, ਍ഀ
		a.canceldays, ਍ഀ
		isnull(c.usebook,'N') AS usebook, ਍ഀ
		c.memo, a.bookprice, ਍ഀ
		c.ISORDINARY, c.ISWORKSHOP , c.ISUNIT, c.EDUPERIOD, B.subjcnt,਍ഀ
		c.reviewdays,਍ഀ
		c.reviewtype਍ഀ
	From tz_subjseq a, ਍ഀ
		tz_courseseq b, ਍ഀ
		tz_subj c ਍ഀ
	Where a.course = b.course ਍ഀ
	and a.cyear = b.cyear ਍ഀ
	and a.courseseq = b.courseseq ਍ഀ
	and a.subj = c.subj ਍ഀ
--WITH READ ONLY;਍ഀ
/*਍ഀ
Select * From tz_courseseq ਍ഀ
select * from  VZ_SCSUBJSEQ਍ഀ
select useproposeapproval,usemanagerapproval  from  tz_subjseq਍ഀ
select * from  tz_subj਍ഀ
select * from tz_subjseq a਍ഀ
	join tz_courseseq b਍ഀ
		on a.course = b.course  and  a.cyear = b.cyear ਍ഀ
			and a.courseseq = b.courseseq ਍ഀ
	join tz_subj c  ਍ഀ
		on  a.subj = c.subj ਍ഀ
Select matchcode From tz_classfymatch cl, tz_subj c  Where cl.upperclass = c.upperclass਍ഀ
Select * from tz_classfymatch cl਍ഀ
	join Select * from tz_subj su਍ഀ
		on cl.upperclass =zz਍ഀ
Select * From tz_courseseq਍ഀ
*/਍ഀ
਍ഀ
਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
CREATE VIEW dbo.VZ_STUDENT਍ഀ
(਍ഀ
	SUBJ, [YEAR], SUBJSEQ, USERID, CLASS, ਍ഀ
	 COMP, ISDINSERT, SCORE, TSTEP, MTEST, ਍ഀ
	 FTEST, REPORT, ACT, ETC1, ETC2, ਍ഀ
	 AVTSTEP, AVMTEST, AVFTEST, AVREPORT, AVACT, ਍ഀ
	 AVETC1, AVETC2, ISGRADUATED, ISRESTUDY, ISB2C, ਍ഀ
	 BRANCH, CONFIRMDATE, EDUNO, LUSERID, LDATE, ਍ഀ
	 HTEST, AVHTEST, NOTGRADUETC, STUSTATUS, CHKFINAL, ਍ഀ
	 GRCODE, EDUSTART, EDUEND, STUDENTLIMIT਍ഀ
)਍ഀ
AS ਍ഀ
	Select਍ഀ
		stu.subj,਍ഀ
		stu.[year],਍ഀ
		stu.subjseq,਍ഀ
		stu.userid,਍ഀ
		stu.class,਍ഀ
		stu.comp,਍ഀ
		stu.isdinsert,਍ഀ
		stu.score,਍ഀ
		stu.tstep,਍ഀ
		stu.mtest,਍ഀ
		stu.ftest,਍ഀ
		stu.report,਍ഀ
		stu.act,਍ഀ
		stu.etc1,਍ഀ
		stu.etc2,਍ഀ
		stu.avtstep,਍ഀ
		stu.avmtest,਍ഀ
		stu.avftest,਍ഀ
		stu.avreport,਍ഀ
		stu.avact,਍ഀ
		stu.avetc1,਍ഀ
		stu.avetc2,਍ഀ
		stu.isgraduated,਍ഀ
		stu.isrestudy,਍ഀ
		stu.isb2c,਍ഀ
		stu.branch,਍ഀ
		stu.confirmdate,਍ഀ
		stu.eduno,਍ഀ
		stu.luserid,਍ഀ
		stu.ldate,਍ഀ
		stu.htest,਍ഀ
		stu.avhtest,਍ഀ
		stu.notgraduetc,਍ഀ
		stu.stustatus,਍ഀ
		stu.chkfnal,਍ഀ
		a.grcode,਍ഀ
		a.edustart,਍ഀ
		a.eduend,਍ഀ
		a.studentlimit਍ഀ
	From਍ഀ
	(਍ഀ
		(਍ഀ
		Select ਍ഀ
		  subj,਍ഀ
		  [year],਍ഀ
		  subjseq,਍ഀ
		  userid,਍ഀ
		  class,਍ഀ
		  comp,਍ഀ
		  isdinsert,਍ഀ
		  score,਍ഀ
		  tstep,਍ഀ
		  mtest,਍ഀ
		  ftest,਍ഀ
		  report,਍ഀ
		  act,਍ഀ
		  etc1,਍ഀ
		  etc2,਍ഀ
		  avtstep,਍ഀ
		  avmtest,਍ഀ
		  avftest,਍ഀ
		  avreport,਍ഀ
		  avact,਍ഀ
		  avetc1,਍ഀ
		  avetc2,਍ഀ
		  isgraduated,਍ഀ
		  isrestudy,਍ഀ
		  isb2c,਍ഀ
		  branch,਍ഀ
		  confirmdate,਍ഀ
		  eduno,਍ഀ
		  luserid,਍ഀ
		  ldate,਍ഀ
		  htest,਍ഀ
		  avhtest,਍ഀ
		  notgraduetc,਍ഀ
		  stustatus,਍ഀ
		  'Y' chkfnal਍ഀ
		From਍ഀ
		  tz_student਍ഀ
		)਍ഀ
		Union਍ഀ
		(਍ഀ
			Select ਍ഀ
			subj,਍ഀ
			year,਍ഀ
			subjseq,਍ഀ
			userid,਍ഀ
			class,਍ഀ
			comp,਍ഀ
			isdinsert,਍ഀ
			score,਍ഀ
			tstep,਍ഀ
			mtest,਍ഀ
			ftest,਍ഀ
			report,਍ഀ
			act,਍ഀ
			etc1,਍ഀ
			etc2,਍ഀ
			avtstep,਍ഀ
			avmtest,਍ഀ
			avftest,਍ഀ
			avreport,਍ഀ
			avact,਍ഀ
			avetc1,਍ഀ
			avetc2,਍ഀ
			isgraduated,਍ഀ
			isrestudy,਍ഀ
			isb2c,਍ഀ
			branch,਍ഀ
			confirmdate,਍ഀ
			eduno,਍ഀ
			luserid,਍ഀ
			ldate,਍ഀ
			htest,਍ഀ
			avhtest,਍ഀ
			notgraduetc,਍ഀ
			stustatus,਍ഀ
			'N' as  chkfinal਍ഀ
			From਍ഀ
			tz_studentreject਍ഀ
		)਍ഀ
	) stu, tz_subjseq a਍ഀ
	Where਍ഀ
	stu.subj = a.subj਍ഀ
	and stu.year = a.year਍ഀ
	and stu.subjseq = a.subjseq਍ഀ
	਍ഀ
	--WITH READ ONLY;਍ഀ
	਍ഀ
	਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
CREATE  VIEW dbo.VZ_SUBJCOURSESEQ਍ഀ
(਍ഀ
	GRCODE, GYEAR, GRSEQ, SUBJ, YEAR, ਍ഀ
	SUBJSEQ, SUBJNM, PROPSTART, PROPEND, EDUSTART, ਍ഀ
	EDUEND, SUBJTYPE਍ഀ
)਍ഀ
AS ਍ഀ
	Select grcode, gyear, grseq, subj, year, subjseq, subjnm, ਍ഀ
	       propstart, propend, edustart, eduend, 'S' ਍ഀ
	 From tz_subjseq  a ਍ഀ
	 Where isbelongcourse = 'N' ਍ഀ
	਍ഀ
	union all ਍ഀ
	Select grcode, gyear, grseq, course, cyear, courseseq, coursenm, ਍ഀ
	       propstart, propend, edustart, eduend, 'C' ਍ഀ
	 From tz_courseseq a ਍ഀ
	 Where course != '000000' ਍ഀ
--WITH READ ONLY;਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
CREATE PROCEDURE sp_lock2 ਍ഀ
@spid1 int = NULL, /* server process id to check for locks */ ਍ഀ
@spid2 int = NULL /* other process id to check for locks */ ਍ഀ
--WITH ENCRYPTION ਍ഀ
AS ਍ഀ
਍ഀ
SET NOCOUNT ON ਍ഀ
਍ഀ
IF @spid1 IS NOT NULL ਍ഀ
BEGIN ਍ഀ
   SELECT CONVERT (smallint, req_spid) AS spid,  ਍ഀ
                 rsc_dbid AS dbid,  ਍ഀ
                 d.[name] AS Database_Name,  ਍ഀ
                 rsc_objid AS ObjId,  ਍ഀ
	  (select  name from sysobjects where id = rsc_objid) oname,਍ഀ
                 ISNULL(o.[name], '해당 사항 없슴') AS [Object Name],  ਍ഀ
                 rsc_indid AS IndId,  ਍ഀ
                 CASE SUBSTRING (v.name, 1, 4)  ਍ഀ
                               WHEN 'DB ' THEN 'DATABASE'  ਍ഀ
                               WHEN 'KEY ' THEN 'KEY'  ਍ഀ
                               WHEN 'EXT ' THEN 'EXTENT'  ਍ഀ
                               WHEN 'TAB ' THEN 'TABLE'  ਍ഀ
                               WHEN 'PAG ' THEN 'PAGE'  ਍ഀ
                               WHEN 'RID ' THEN 'ROW IDENTIFIER'  ਍ഀ
                 END AS Type,  ਍ഀ
                 CASE SUBSTRING (v.name, 1, 4)  ਍ഀ
                               WHEN 'EXT ' THEN 'FIELD : PAGE = ' + SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                               WHEN 'PAG ' THEN 'FIEL ID : PAGE' + SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                               WHEN 'RID ' THEN 'Field : Page : RID = ' + SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                               ELSE SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                 END AS Resource,  ਍ഀ
                 CASE SUBSTRING (u.name, 1, 8)  ਍ഀ
                               WHEN 'Sch-S ' THEN 'Schema Stability(Sch-S)'  ਍ഀ
                               WHEN 'Sch-M ' THEN 'Schema Modification(Sch-M)'  ਍ഀ
                               WHEN 'IS ' THEN 'Intent Shared Lock(IS)'  ਍ഀ
                               WHEN 'SIU ' THEN 'Shared Intent Update Lock(SIU)'  ਍ഀ
                               WHEN 'IS-S ' THEN 'Intent Shared-Shared Lock(IS-S)'  ਍ഀ
                               WHEN 'IX ' THEN 'Intent Exclusive Lock(IX)'  ਍ഀ
                               WHEN 'SIX ' THEN 'Shared Intent Exclusive Lock(SIX)'  ਍ഀ
                               WHEN 'S ' THEN 'Shared Lock(S)'  ਍ഀ
                               WHEN 'U ' THEN 'Update Lock(U)'  ਍ഀ
                               WHEN 'IIn-Nul ' THEN 'Intent Insert-NULL(IIn-Null)'  ਍ഀ
                               WHEN 'IS-X ' THEN 'Intent Shared-Exclusive Lock(IS-X)'  ਍ഀ
                               WHEN 'IU ' THEN 'Intent Update Lock(IU)'  ਍ഀ
                               WHEN 'IS-U ' THEN 'Intent Shared-Update Lock(IS-U)'  ਍ഀ
                               WHEN 'X ' THEN 'Exclusive Lock(X)'  ਍ഀ
                               WHEN 'I ' THEN 'Intent Lock(I)'  ਍ഀ
                               WHEN 'Sch ' THEN 'Schema Lock(Sch)'  ਍ഀ
                               WHEN 'BU ' THEN 'Bulk Operations(BU)'  ਍ഀ
                 END AS Mode,  ਍ഀ
                 SUBSTRING (x.name, 1, 5) AS Status,  ਍ഀ
                 CASE req_ownertype  ਍ഀ
                               WHEN 1 THEN 'Transaction'  ਍ഀ
                               WHEN 2 THEN 'Session'  ਍ഀ
                               WHEN 3 THEN 'Cursor'  ਍ഀ
                               ELSE 'N/A'  ਍ഀ
                 END AS Owner ਍ഀ
਍ഀ
   FROM mASter.dbo.syslockinfo, ਍ഀ
              mASter.dbo.spt_values v,  ਍ഀ
              mASter.dbo.spt_values x,  ਍ഀ
              mASter.dbo.spt_values u,  ਍ഀ
              mASter.dbo.sysdatabASes d,  ਍ഀ
              mASter.dbo.sysobjects o ਍ഀ
਍ഀ
   WHERE mASter.dbo.syslockinfo.rsc_type = v.number  ਍ഀ
                                   and v.type = 'LR'  ਍ഀ
                                   and mASter.dbo.syslockinfo.req_status = x.number  ਍ഀ
                                   and x.type = 'LS'  ਍ഀ
                                   and mASter.dbo.syslockinfo.req_mode + 1 = u.number  ਍ഀ
                                   and u.type = 'L'  ਍ഀ
                                   AND rsc_dbid = d.dbid  ਍ഀ
                                   AND rsc_objid = o.[id]  ਍ഀ
                                   and req_spid in (@spid1, @spid2) ਍ഀ
਍ഀ
 END ਍ഀ
਍ഀ
/* ਍ഀ
** No parameters, so show all the locks. ਍ഀ
*/ ਍ഀ
ELSE ਍ഀ
BEGIN  ਍ഀ
   SELECT CONVERT (smallint, req_spid) AS spid,  ਍ഀ
                rsc_dbid AS dbid,  ਍ഀ
                d.[name] AS [Database Name],  ਍ഀ
                rsc_objid AS ObjId,  ਍ഀ
	  (select  name from sysobjects where id = rsc_objid) oname,਍ഀ
                ISNULL(o.[name], '해당 사항 없슴') AS [Object Name],  ਍ഀ
                rsc_indid AS IndId,  ਍ഀ
                CASE SUBSTRING (v.name, 1, 4)  ਍ഀ
                             WHEN 'DB ' THEN 'DATABASE'  ਍ഀ
                             WHEN 'KEY ' THEN 'KEY'  ਍ഀ
                             WHEN 'EXT ' THEN 'EXTENT'  ਍ഀ
                             WHEN 'TAB ' THEN 'TABLE'  ਍ഀ
                             WHEN 'PAG ' THEN 'PAGE'  ਍ഀ
                             WHEN 'RID ' THEN 'ROW IDENTIFIER'  ਍ഀ
                END AS Type,  ਍ഀ
                CASE SUBSTRING (v.name, 1, 4)  ਍ഀ
                             WHEN 'EXT ' THEN 'FIELD : PAGE = ' + SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                             WHEN 'PAG ' THEN 'FIEL ID : PAGE' + SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                             WHEN 'RID ' THEN 'Field : Page : RID = ' + SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                             ELSE SUBSTRING (rsc_text, 1, 16)  ਍ഀ
                END AS Resource,  ਍ഀ
                CASE SUBSTRING (u.name, 1, 8)  ਍ഀ
                             WHEN 'Sch-S ' THEN 'Schema Stability(Sch-S)'  ਍ഀ
                             WHEN 'Sch-M ' THEN 'Schema Modification(Sch-M)'  ਍ഀ
                             WHEN 'IS ' THEN 'Intent Shared Lock(IS)'  ਍ഀ
                             WHEN 'SIU ' THEN 'Shared Intent Update Lock(SIU)'  ਍ഀ
                             WHEN 'IS-S ' THEN 'Intent Shared-Shared Lock(IS-S)'  ਍ഀ
                             WHEN 'IX ' THEN 'Intent Exclusive Lock(IX)'  ਍ഀ
                             WHEN 'SIX ' THEN 'Shared Intent Exclusive Lock(SIX)'  ਍ഀ
                             WHEN 'S ' THEN 'Shared Lock(S)'  ਍ഀ
                             WHEN 'U ' THEN 'Update Lock(U)'  ਍ഀ
                             WHEN 'IIn-Nul ' THEN 'Intent Insert-NULL(IIn-Null)'  ਍ഀ
                             WHEN 'IS-X ' THEN 'Intent Shared-Exclusive Lock(IS-X)'  ਍ഀ
                             WHEN 'IU ' THEN 'Intent Update Lock(IU)'  ਍ഀ
                             WHEN 'IS-U ' THEN 'Intent Shared-Update Lock(IS-U)'  ਍ഀ
                             WHEN 'X ' THEN 'Exclusive Lock(X)'  ਍ഀ
                             WHEN 'I ' THEN 'Intent Lock(I)'  ਍ഀ
                             WHEN 'Sch ' THEN 'Schema Lock(Sch)'  ਍ഀ
                             WHEN 'BU ' THEN 'Bulk Operations(BU)'  ਍ഀ
                END AS Mode,  ਍ഀ
                SUBSTRING (x.name, 1, 5) AS Status,  ਍ഀ
                CASE req_ownertype  ਍ഀ
                             WHEN 1 THEN 'Transaction'  ਍ഀ
                             WHEN 2 THEN 'Session'  ਍ഀ
                             WHEN 3 THEN 'Cursor'  ਍ഀ
                             ELSE 'N/A'  ਍ഀ
                END AS Owner ਍ഀ
਍ഀ
   FROM mASter.dbo.syslockinfo,  ਍ഀ
                mASter.dbo.spt_values v,  ਍ഀ
                mASter.dbo.spt_values x,  ਍ഀ
                mASter.dbo.spt_values u,  ਍ഀ
                mASter.dbo.sysdatabASes d,  ਍ഀ
                mASter.dbo.sysobjects o ਍ഀ
਍ഀ
   WHERE mASter.dbo.syslockinfo.rsc_type = v.number  ਍ഀ
                and v.type = 'LR'  ਍ഀ
                and mASter.dbo.syslockinfo.req_status = x.number  ਍ഀ
                and x.type = 'LS'  ਍ഀ
                and mASter.dbo.syslockinfo.req_mode + 1 = u.number  ਍ഀ
                and u.type = 'L'  ਍ഀ
                AND rsc_dbid = d.dbid  ਍ഀ
                AND rsc_objid *= o.[id]  ਍ഀ
   ORDER BY spid ਍ഀ
END ਍ഀ
਍ഀ
RETURN (0) -- sp_lock ਍ഀ
਍ഀ
਍ഀ
਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
create procedure sp_lock3਍ഀ
@spid1 int = NULL,      /* server process id to check for locks */਍ഀ
@spid2 int = NULL       /* other process id to check for locks */਍ഀ
as਍ഀ
਍ഀ
set nocount on਍ഀ
/*਍ഀ
** Show the locks for both parameters.਍ഀ
*/਍ഀ
declare @objid int,਍ഀ
   @indid int,਍ഀ
   @dbid int,਍ഀ
   @string Nvarchar(255)਍ഀ
਍ഀ
CREATE TABLE #locktable਍ഀ
   (਍ഀ
   spid       smallint਍ഀ
   ,loginname nvarchar(20)਍ഀ
   ,hostname  nvarchar(30)਍ഀ
   ,dbid      int਍ഀ
   ,dbname    nvarchar(20)਍ഀ
   ,ObjOwner  nvarchar(128)਍ഀ
   ,objId     int਍ഀ
   ,ObjName   nvarchar(128)਍ഀ
   ,IndId     int਍ഀ
   ,IndName   nvarchar(128)਍ഀ
   ,Type      nvarchar(4)਍ഀ
   ,Resource  nvarchar(16)਍ഀ
   ,Mode      nvarchar(8)਍ഀ
   ,Status    nvarchar(5)਍ഀ
   )਍ഀ
਍ഀ
if @spid1 is not NULL਍ഀ
begin਍ഀ
   INSERT #locktable਍ഀ
      (਍ഀ
      spid਍ഀ
      ,loginname਍ഀ
      ,hostname਍ഀ
      ,dbid਍ഀ
      ,dbname਍ഀ
      ,ObjOwner਍ഀ
      ,objId਍ഀ
      ,ObjName਍ഀ
      ,IndId਍ഀ
      ,IndName਍ഀ
      ,Type਍ഀ
      ,Resource਍ഀ
      ,Mode਍ഀ
      ,Status਍ഀ
      )਍ഀ
   select convert (smallint, l.req_spid)਍ഀ
      ,coalesce(substring (s.loginame, 1, 20),'')਍ഀ
      ,coalesce(substring (s.hostname, 1, 30),'')਍ഀ
      ,l.rsc_dbid਍ഀ
      ,substring (db_name(l.rsc_dbid), 1, 20)਍ഀ
      ,''਍ഀ
      ,l.rsc_objid਍ഀ
      ,''਍ഀ
      ,l.rsc_indid਍ഀ
      ,''਍ഀ
      ,substring (v.name, 1, 4)਍ഀ
      ,substring (l.rsc_text, 1, 16)਍ഀ
      ,substring (u.name, 1, 8)਍ഀ
      ,substring (x.name, 1, 5)਍ഀ
   from master.dbo.syslockinfo l,਍ഀ
      master.dbo.spt_values v,਍ഀ
      master.dbo.spt_values x,਍ഀ
      master.dbo.spt_values u,਍ഀ
      master.dbo.sysprocesses s਍ഀ
   where l.rsc_type = v.number਍ഀ
   and   v.type = 'LR'਍ഀ
   and   l.req_status = x.number਍ഀ
   and   x.type = 'LS'਍ഀ
   and   l.req_mode + 1 = u.number਍ഀ
   and   u.type = 'L'਍ഀ
   and   req_spid in (@spid1, @spid2)਍ഀ
   and   req_spid = s.spid਍ഀ
end਍ഀ
/*਍ഀ
** No parameters, so show all the locks.਍ഀ
*/਍ഀ
else਍ഀ
begin਍ഀ
   INSERT #locktable਍ഀ
      (਍ഀ
      spid਍ഀ
      ,loginname਍ഀ
      ,hostname਍ഀ
      ,dbid਍ഀ
      ,dbname਍ഀ
      ,ObjOwner਍ഀ
      ,objId਍ഀ
      ,ObjName਍ഀ
      ,IndId਍ഀ
      ,IndName਍ഀ
      ,Type਍ഀ
      ,Resource਍ഀ
      ,Mode਍ഀ
      ,Status਍ഀ
      )਍ഀ
   select convert (smallint, l.req_spid)਍ഀ
      ,coalesce(substring (s.loginame, 1, 20),'')਍ഀ
      ,coalesce(substring (s.hostname, 1, 30),'')਍ഀ
      ,l.rsc_dbid਍ഀ
      ,substring (db_name(l.rsc_dbid), 1, 20)਍ഀ
      ,''਍ഀ
      ,l.rsc_objid਍ഀ
      ,''਍ഀ
      ,l.rsc_indid਍ഀ
      ,''਍ഀ
      ,substring (v.name, 1, 4)਍ഀ
      ,substring (l.rsc_text, 1, 16)਍ഀ
      ,substring (u.name, 1, 8)਍ഀ
      ,substring (x.name, 1, 5)਍ഀ
   from master.dbo.syslockinfo l,਍ഀ
      master.dbo.spt_values v,਍ഀ
      master.dbo.spt_values x,਍ഀ
      master.dbo.spt_values u,਍ഀ
      master.dbo.sysprocesses s਍ഀ
   where l.rsc_type = v.number਍ഀ
   and   v.type = 'LR'਍ഀ
   and   l.req_status = x.number਍ഀ
   and   x.type = 'LS'਍ഀ
   and   l.req_mode + 1 = u.number਍ഀ
   and   u.type = 'L'਍ഀ
   and   req_spid = s.spid਍ഀ
   order by spID਍ഀ
END਍ഀ
DECLARE lock_cursor CURSOR਍ഀ
FOR SELECT dbid, ObjId, IndId FROM #locktable਍ഀ
  WHERE Type <>'DB' and Type <> 'FIL'਍ഀ
਍ഀ
OPEN lock_cursor਍ഀ
FETCH NEXT FROM lock_cursor INTO @dbid, @ObjId, @IndId਍ഀ
WHILE @@FETCH_STATUS = 0਍ഀ
   BEGIN਍ഀ
਍ഀ
   SELECT @string =਍ഀ
      'USE ' + db_name(@dbid) + char(13)਍ഀ
      + 'update #locktable set ObjName = name, ObjOwner = USER_NAME(uid)'਍ഀ
      + ' from sysobjects where id = ' + convert(varchar(32),@objid)਍ഀ
      + ' and ObjId = ' + convert(varchar(32),@objid)਍ഀ
      + ' and dbid = ' + convert(varchar(32),@dbId)਍ഀ
਍ഀ
   EXECUTE (@string)਍ഀ
਍ഀ
   SELECT @string =਍ഀ
      'USE ' + db_name(@dbid) + char(13)਍ഀ
      + 'update #locktable set IndName = i.name from sysindexes i '਍ഀ
      + ' where i.id = ' + convert(varchar(32),@objid)਍ഀ
      + ' and i.indid = ' + convert(varchar(32),@indid)਍ഀ
      + ' and ObjId = ' + convert(varchar(32),@objid)਍ഀ
      + ' and dbid = ' + convert(varchar(32),@dbId)਍ഀ
      + ' and #locktable.indid = ' + convert(varchar(32),@indid)਍ഀ
਍ഀ
   EXECUTE (@string)਍ഀ
਍ഀ
   FETCH NEXT FROM lock_cursor INTO @dbid, @ObjId, @IndId਍ഀ
   END਍ഀ
CLOSE lock_cursor਍ഀ
DEALLOCATE lock_cursor਍ഀ
਍ഀ
SELECT * FROM #locktable਍ഀ
return (0)਍ഀ
-- END sp_lock2਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE PROC p_chp_prg਍ഀ
@p_leccode varchar (30),਍ഀ
@p_subj varchar (30),਍ഀ
@p_year varchar (30),਍ഀ
@p_subjseq varchar (30)਍ഀ
਍ഀ
AS਍ഀ
SET NOCOUNT ON਍ഀ
਍ഀ
--커서 선언਍ഀ
DECLARE c_chp_prg CURSOR਍ഀ
FOR਍ഀ
SELECT leccode, chpcode, usrcode, convert(varchar, prgsdat, 112), convert(varchar, prgedat, 112), prgcont FROM chp_prg਍ഀ
WHERE leccode = @p_leccode਍ഀ
਍ഀ
--커서 오픈਍ഀ
OPEN c_chp_prg਍ഀ
਍ഀ
--변수 선언਍ഀ
DECLARE @v_leccode VARCHAR(30)਍ഀ
DECLARE @v_chpcode varchar(3)਍ഀ
DECLARE @v_usrcode varchar(20)਍ഀ
DECLARE @v_prgsdat varchar (30)਍ഀ
DECLARE @v_prgedat varchar (30)਍ഀ
DECLARE @v_prgcont int਍ഀ
DECLARE @v_lesson varchar(3)਍ഀ
਍ഀ
਍ഀ
--첫 로우 FETCH਍ഀ
FETCH NEXT FROM c_chp_prg INTO @v_leccode, @v_chpcode, @v_usrcode, @v_prgsdat, @v_prgedat, @v_prgcont਍ഀ
WHILE @@FETCH_STATUS = 0਍ഀ
BEGIN਍ഀ
਍ഀ
IF @v_chpcode  < 10 ਍ഀ
begin਍ഀ
  select @v_lesson = '00' + @v_chpcode ਍ഀ
end਍ഀ
਍ഀ
else  ਍ഀ
begin਍ഀ
  select @v_lesson = '0' + @v_chpcode ਍ഀ
end਍ഀ
਍ഀ
਍ഀ
--FETCH된 데이터를 tempdb에 삽입਍ഀ
INSERT INTO tz_progress (subj, year,  subjseq, lesson, oid,  userid, first_edu, first_end, lesson_count,  ldate)਍ഀ
VALUES(@p_subj, @p_year, @p_subjseq, @v_lesson, '1', @v_usrcode, @v_prgsdat+'000000', @v_prgedat+'000000', @v_prgcont, convert(varchar, getdate(), 112)+'000000')਍ഀ
਍ഀ
--다음 로우 FEETCH - 루프਍ഀ
FETCH NEXT FROM c_chp_prg INTO @v_leccode, @v_chpcode, @v_usrcode, @v_prgsdat, @v_prgedat, @v_prgcont਍ഀ
END਍ഀ
਍ഀ
--커서 CLOSE਍ഀ
CLOSE c_chp_prg਍ഀ
਍ഀ
--커서 DEALLOCATE਍ഀ
DEALLOCATE c_chp_prg਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
CREATE PROC p_student਍ഀ
@p_leccode varchar (30),਍ഀ
@p_subj varchar (30),਍ഀ
@p_year varchar (30),਍ഀ
@p_subjseq varchar (30)਍ഀ
AS਍ഀ
SET NOCOUNT ON਍ഀ
਍ഀ
--커서 선언਍ഀ
DECLARE c_lec_req CURSOR਍ഀ
FOR਍ഀ
SELECT leccode, usrcode, totscre FROM lec_req਍ഀ
--WHERE leccode = @p_leccode਍ഀ
WHERE leccode = @p_leccode and reqstat='LP'਍ഀ
਍ഀ
--커서 오픈਍ഀ
OPEN c_lec_req਍ഀ
਍ഀ
--변수 선언਍ഀ
DECLARE @v_leccode VARCHAR(30)਍ഀ
DECLARE @v_chpcode varchar(3)਍ഀ
DECLARE @v_usrcode varchar(20)਍ഀ
DECLARE @v_totscre int਍ഀ
DECLARE @v_lesson varchar(3)਍ഀ
਍ഀ
਍ഀ
--첫 로우 FETCH਍ഀ
FETCH NEXT FROM c_lec_req INTO @v_leccode, @v_usrcode, @v_totscre਍ഀ
WHILE @@FETCH_STATUS = 0਍ഀ
BEGIN਍ഀ
਍ഀ
਍ഀ
--FETCH된 데이터를 tempdb에 삽입਍ഀ
INSERT INTO tz_student (subj, year,  subjseq, userid, score)਍ഀ
VALUES(@p_subj, @p_year, @p_subjseq, @v_usrcode, @v_totscre)਍ഀ
਍ഀ
INSERT INTO tz_propose (subj, year,  subjseq, userid, chkfinal)਍ഀ
VALUES(@p_subj, @p_year, @p_subjseq, @v_usrcode, 'Y')਍ഀ
਍ഀ
--INSERT INTO tz_propose (subj, year,  subjseq, userid, chkfinal, isdinsert,chkfirst)਍ഀ
--VALUES(@p_subj, @p_year, @p_subjseq, @v_usrcode, 'N','N','N')਍ഀ
਍ഀ
--다음 로우 FEETCH - 루프਍ഀ
FETCH NEXT FROM c_lec_req INTO @v_leccode, @v_usrcode, @v_totscre਍ഀ
END਍ഀ
਍ഀ
--커서 CLOSE਍ഀ
CLOSE c_lec_req਍ഀ
਍ഀ
--커서 DEALLOCATE਍ഀ
DEALLOCATE c_lec_req਍ഀ
਍ഀ
਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER ON ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
create function dbo.LPAD਍ഀ
(@ename varchar(10), @ct int, @chr varchar(2))਍ഀ
returns varchar(100)਍ഀ
as਍ഀ
begin਍ഀ
return (replicate(@chr, @ct-len(@ename))+@ename)਍ഀ
end਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
Create Function dbo.get_deptnm( @p_deptnm Varchar(40), @p_userid Varchar(20) = null)਍ഀ
RETURNS varchar(40)਍ഀ
as਍ഀ
begin਍ഀ
	Declare @v_deptnm varchar(40)਍ഀ
	਍ഀ
	If (@p_deptnm is not null)਍ഀ
		set @v_deptnm = @p_deptnm਍ഀ
	Else਍ഀ
		If (@p_userid is not null )਍ഀ
			set  @v_deptnm	= (select top 1 deptnam  from tz_member where userid = @p_userid )਍ഀ
	Return @v_deptnm਍ഀ
end਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE FUNCTION dbo.get_jikupnm(@p_jikup varchar(10), @p_comp varchar(4) = null, @p_jikupnm varchar(50))   returns varchar(50)਍ഀ
/*=================================================================਍ഀ
        PROCEDURE NAME 	: get_jikupnm਍ഀ
        EXPLAIN                	: get jikipnm name਍ഀ
        WRITTEM DATE   	: 2003. 7. 28਍ഀ
        AUTHOR                 	: LeeSumin਍ഀ
        E-MAIL 				: icarus@credu.com਍ഀ
        COMMENT                 	:਍ഀ
=================================================================*/਍ഀ
AS਍ഀ
BEGIN਍ഀ
      	declare @v_jikupnm	Varchar(50) ਍ഀ
	declare @v_cnt		int਍ഀ
	਍ഀ
	Set @v_jikupnm = '-'਍ഀ
	Set @v_cnt = 0਍ഀ
	If( @p_jikupnm is not null)਍ഀ
		Set @v_jikupnm = @p_jikupnm਍ഀ
	return @v_jikupnm਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
create function dbo.get_name(@p_userid varchar(20))਍ഀ
returns varchar(100) as਍ഀ
begin਍ഀ
  declare @v_name varchar(100)  ਍ഀ
  select   top 1 @v_name=name from tz_member a where userid=@p_userid਍ഀ
  return @v_name਍ഀ
end਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
create function dbo.instr(@str varchar(8000), @patten varchar(100), @start int=1, @cnt int=1)਍ഀ
returns int਍ഀ
as਍ഀ
begin਍ഀ
    declare @i int, @j int, @k int, @l int਍ഀ
    set @i = 1਍ഀ
    set @j = @start - 1਍ഀ
    set @k = 0਍ഀ
    set @l = datalength(@patten)਍ഀ
    set @str = substring(@str, @start, 8000)਍ഀ
    while (@i <= @cnt)਍ഀ
    begin਍ഀ
        set @k = charindex(@patten, @str)਍ഀ
        if @k = 0਍ഀ
            break਍ഀ
        set @j = @j + @k਍ഀ
        set @str = substring(@str, @k+@l, 8000)਍ഀ
        set @i = @i + 1਍ഀ
    end਍ഀ
    return(case when @k = 0 then @k else @j + ((@cnt - 1) * (@l - 1)) end)਍ഀ
end਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE FUNCTION dbo.nvl(@string varchar, @parm varchar(20)=NULL)਍ഀ
	RETURNS varchar(200)਍ഀ
AS਍ഀ
	BEGIN਍ഀ
	        DECLARE @s_rtn varchar(20)਍ഀ
	       If(@string is null)਍ഀ
			Begin਍ഀ
				set @s_rtn = @parm਍ഀ
			End਍ഀ
		Else਍ഀ
			Begin਍ഀ
				set @s_rtn = @string਍ഀ
			End਍ഀ
	਍ഀ
	        return @s_rtn਍ഀ
	END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE FUNCTION dbo.to_char(@IntNumber int, @attr varchar(20)=NULL)਍ഀ
RETURNS varchar(20)਍ഀ
AS਍ഀ
BEGIN਍ഀ
	declare @StrNumber varchar(20)਍ഀ
	declare @IntLen int਍ഀ
	set @IntLen = LEN(@attr)਍ഀ
	set @StrNumber = @attr+convert(varchar(10),@IntNumber)਍ഀ
	return right(@StrNumber,@IntLen)਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE FUNCTION dbo.to_date(@todate datetime, @parm varchar(20)=NULL)਍ഀ
RETURNS varchar(20)਍ഀ
AS਍ഀ
BEGIN਍ഀ
        DECLARE @s_todate varchar(20)਍ഀ
        if @parm = NULL return null਍ഀ
        if SUBSTRING(@parm,1,4)='YYYY'਍ഀ
                SET @s_todate=CONVERT(CHAR(4) , DATEPART(YYYY, @todate))਍ഀ
        if SUBSTRING(@parm,5,2)='MM'਍ഀ
                SET @s_todate=@s_todate+RIGHT('0'+CONVERT(VARCHAR(2),DATEPART(MM, @todate)),2)਍ഀ
        if SUBSTRING(@parm,7,2)='DD'਍ഀ
                SET @s_todate=@s_todate+RIGHT('0'+CONVERT(VARCHAR(2),DATEPART(DD, @todate)),2)਍ഀ
        if SUBSTRING(@parm,9,4)='HH24'਍ഀ
                SET @s_todate=@s_todate+RIGHT('0'+CONVERT(VARCHAR(2),DATEPART(HH, @todate)),2)਍ഀ
        if SUBSTRING(@parm,13,2)='MI'਍ഀ
                SET @s_todate=@s_todate+RIGHT('0'+CONVERT(VARCHAR(2),DATEPART(MI, @todate)),2)਍ഀ
        if SUBSTRING(@parm,15,2)='SS'਍ഀ
                SET @s_todate=@s_todate+RIGHT('0'+CONVERT(VARCHAR(2),DATEPART(SS, @todate)),2)਍ഀ
        return @s_todate਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
create FUNCTION dbo.to_number(@StrNumber varchar(20))਍ഀ
RETURNS int਍ഀ
AS਍ഀ
BEGIN਍ഀ
	return convert(int, @StrNumber)਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE FUNCTION dbo.to_number2(@StrNumber varchar(20))਍ഀ
RETURNS numeric਍ഀ
AS਍ഀ
BEGIN਍ഀ
	return convert(numeric(20), @StrNumber)਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
create function dbo.get_codenm(@p_gubun varchar(20),@p_code varchar(20))਍ഀ
returns varchar(100) as਍ഀ
begin਍ഀ
  declare @v_name varchar(100)  ਍ഀ
  select   top 1 @v_name=codenm  from tz_code a where code=@p_code and gubun=@p_gubun਍ഀ
  return @v_name਍ഀ
end਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE   FUNCTION dbo.get_compnm(   @p_comp varchar(10), @p_s int = 2, @p_e int= 4) returns varchar(100)਍ഀ
/*=================================================================਍ഀ
        PROCEDURE NAME  : get_compnm਍ഀ
        EXPLAIN                 : get comp name਍ഀ
        WRITTEM DATE    : 2003. 8. 12਍ഀ
        AUTHOR                  : LeeSumin਍ഀ
        E-MAIL                  : icarus@credu.com਍ഀ
        COMMENT                 :਍ഀ
=================================================================*/਍ഀ
AS਍ഀ
BEGIN਍ഀ
DECLARE @v_compnm varchar(50) ਍ഀ
SET @v_compnm   = ''਍ഀ
        select  @v_compnm = (CASE @p_s WHEN 1 THEN groupsnm + '/' ਍ഀ
                                        ELSE '' END) ਍ഀ
                + (CASE sign(@p_s-2) WHEN 1 THEN '' ELSE isnull(companynm,'') END)਍ഀ
                + (CASE sign(@p_s-3) WHEN 1 THEN '' ਍ഀ
                                        ELSE ਍ഀ
                                        (CASE sign(@p_e-3) WHEN -1 THEN '' ਍ഀ
                                                           ELSE '/'+isnull(gpmnm,'') END)਍ഀ
                                       END )਍ഀ
                + (CASE sign(@p_e-4) WHEN -1 THEN '' ELSE '/' + isnull(deptnm,'') END )਍ഀ
                + (CASE sign(@p_e-5) WHEN -1 THEN '' ELSE '/' + isnull(partnm,'') END )਍ഀ
          from  tz_comp਍ഀ
         where  comp=@p_comp਍ഀ
        if @@error >0  SET @v_compnm = @p_comp਍ഀ
        return @v_compnm਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE  FUNCTION dbo.get_jikunnm(@p_jikun varchar(10), @p_comp varchar(10) = null)  RETURNS  varchar(50)਍ഀ
/*=================================================================਍ഀ
        PROCEDURE NAME  : get_jikunnm਍ഀ
        EXPLAIN                 : get jikipnm name਍ഀ
        WRITTEM DATE    : 2003. 7. 28਍ഀ
        AUTHOR                  : LeeSumin਍ഀ
        E-MAIL                  : icarus@credu.com਍ഀ
        COMMENT                 :਍ഀ
=================================================================*/਍ഀ
AS਍ഀ
BEGIN਍ഀ
        DECLARE @v_grpcomp VARCHAR(4)਍ഀ
        DECLARE @v_jikunnm  VARCHAR(50)਍ഀ
        DECLARE @v_cnt          INT਍ഀ
        SET @v_grpcomp  = 'ZZZZ'਍ഀ
        SET @v_jikunnm  = null਍ഀ
        SET @v_cnt      = 0਍ഀ
        if @p_comp is not null   SET @v_grpcomp = substring(@p_comp,1,4)਍ഀ
        select @v_cnt =count(*) from tz_jikun where grpcomp=@v_grpcomp and jikun=@p_jikun਍ഀ
        if  @v_cnt = 0਍ഀ
                BEGIN਍ഀ
                        select @v_cnt =count(*)  from tz_jikun where grpcomp=substring(@v_grpcomp,1,2) and jikun=@p_jikun਍ഀ
                        if @v_cnt =0਍ഀ
                                BEGIN਍ഀ
                                select @v_cnt = count(*)  from tz_jikun where grpcomp='ZZZZ' and jikun=@p_jikun਍ഀ
                                if @v_cnt=0਍ഀ
                                        return 'undefined'਍ഀ
                                else਍ഀ
                                        select top 1  @v_jikunnm=jikunnm from tz_jikun where grpcomp='ZZZZ' and jikun=@p_jikun਍ഀ
                                END਍ഀ
                        else਍ഀ
                                select top 1 @v_jikunnm = jikunnm from tz_jikun where grpcomp=substring(@v_grpcomp,1,2) and jikun=@p_jikun਍ഀ
                END਍ഀ
        else਍ഀ
                select top 1 @v_jikunnm =jikunnm  from tz_jikun where grpcomp=substring(@p_comp,1,4) and jikun=@p_jikun਍ഀ
        if @@error >0  SET @v_jikunnm = 'undefined'਍ഀ
        return @v_jikunnm਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS OFF ਍ഀ
GO਍ഀ
਍ഀ
CREATE  FUNCTION dbo.get_jikwinm(@p_jikwi   varchar(10) , @p_comp varchar(4) = null)        returns varchar(50)਍ഀ
/*=================================================================਍ഀ
        PROCEDURE NAME  : get_jikwinm਍ഀ
        EXPLAIN                 : get jikipnm name਍ഀ
        WRITTEM DATE    : 2003. 7. 28਍ഀ
        AUTHOR                  : LeeSumin਍ഀ
        E-MAIL                  : icarus@credu.com਍ഀ
        COMMENT                 :਍ഀ
=================================================================*/਍ഀ
AS਍ഀ
BEGIN਍ഀ
        DECLARE @v_grpcomp      varchar(4)਍ഀ
        DECLARE @v_jikwinm      varchar(50)਍ഀ
        DECLARE @v_cnt          int਍ഀ
        SET @v_grpcomp  = 'ZZZZ'਍ഀ
        SET @v_jikwinm  = null਍ഀ
        SET @v_cnt      = 0਍ഀ
        if @p_comp is not null          SET @v_grpcomp= substring(@p_comp,1,4)਍ഀ
        select  @v_cnt = count(*)  from tz_jikwi where grpcomp=@v_grpcomp and jikwi=@p_jikwi਍ഀ
        if @v_cnt = 0਍ഀ
                BEGIN਍ഀ
                select @v_cnt =count(*) from tz_jikwi where grpcomp=substring(@v_grpcomp,1,2) and jikwi=@p_jikwi਍ഀ
                if @v_cnt =0਍ഀ
                        Begin਍ഀ
                                select @v_cnt= count(*) from tz_jikwi where grpcomp='ZZZZ' and jikwi=@p_jikwi਍ഀ
                                if @v_cnt=0਍ഀ
                                        return 'undefined'਍ഀ
                                else਍ഀ
                                        select top 1 @v_jikwinm = jikwinm   from tz_jikwi where grpcomp='ZZZZ' and jikwi=@p_jikwi਍ഀ
                        End਍ഀ
                else਍ഀ
                        select top 1 @v_jikwinm = jikwinm  from tz_jikwi where grpcomp=substring(@v_grpcomp,1,2) and jikwi=@p_jikwi਍ഀ
                END਍ഀ
        else਍ഀ
                BEGIN਍ഀ
                select top 1 @v_jikwinm=jikwinm from tz_jikwi where grpcomp=substring(@p_comp,1,4) and jikwi=@p_jikwi਍ഀ
                END਍ഀ
        if @@error >0 SET @v_jikwinm = 'undefined'਍ഀ
        return @v_jikwinm਍ഀ
END਍ഀ
਍ഀ
GO਍ഀ
SET QUOTED_IDENTIFIER OFF ਍ഀ
GO਍ഀ
SET ANSI_NULLS ON ਍ഀ
GO਍ഀ
਍ഀ
