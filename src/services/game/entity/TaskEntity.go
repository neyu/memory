/**
游戏-任务表(TaskEntity)
任务表
**/
package table

var TbTask = "uw_task"

type TaskEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 日常任务 **/
	DailyTasks string /*日常任务。{&quot任务id&quot:[完成数量,是否完成],&quot任务id&quot:[完成数量,是否完成],.....}*/
	/** 活跃度 **/
	Vitality int32 /*活跃度*/
	/** 活跃度宝箱领取 **/
	VitalityChests string /*活跃度宝箱领取  【是否领取，是否领取，。。】 下标代表宝箱位置*/
	/** 日常数据最后修改时间 **/
	RefreshTime int64 /*日常数据最后修改时间*/
	/** 成就任务 **/
	Tasks string /*成就任务。{&quot任务子类型&quot:当前正在进行任务,&quot任务子类型&quot:当前正在进行任务,.....}*/
	/** 成就任务完成数据 **/
	TasksValue string /*成就任务完成数据  {&quot子类型&quot:数量,&quot子类型&quot:数量,...}*/
	/** 已领取的成就任务 **/
	DoneTasks string /*已领取的成就任务。 格式为[taskId1, taskId2]*/

}
