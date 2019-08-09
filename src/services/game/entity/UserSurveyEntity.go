/**
主-用户调研(UserSurveyEntity)
主-用户调研(UserSurveyEntity)
**/
package table

var TbUserSurvey = "uw_usersurvey_record"

type UserSurveyEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 服务器id **/
	ServerId int32 /*服务器id*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 用户等级 **/
	UserLvl int32 /*用户等级*/
	/** 用户vip等级 **/
	UserVip int32 /*用户vip等级*/
	/** 活动id **/
	ActivityId int32 /*活动id*/
	/** 题目id **/
	QuestionId int32 /*题目id*/
	/** 玩家选择 **/
	SelectIndex int32 /*玩家选择*/

}
