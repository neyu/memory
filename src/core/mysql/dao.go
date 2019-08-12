package mysql

import (
	"core/logs"
)

func Insert(client *Client, args string, cb func()) {
	var arr = Array.prototype.slice.apply(arguments);
	arr.splice(0, 1, this.Entity);
	var data = arr[1];
	var castCols = this.castCols;
	if(castCols){
		var tempData = arr[1] = {};
		for (var key in data) {
			tempData[key] = data[key];
		}
		for (var key in castCols) {
			var value = tempData[key];
			if(value && typeof value != "string") {
				tempData[key] = JSON.stringify(value);
			}	
		}
	}
	client.insert.apply(client, arr);
}

func InsertList(client *Client, args string, cb func()){
	var arr = Array.prototype.slice.apply(arguments);
	arr.splice(0, 1, this.Entity);
	client.insertList.apply(client, arr);
}

func Update(client *Client, values string, cnd string, args string, cb func()){
	var arr = Array.prototype.slice.apply(arguments);
	arr.splice(0, 1, this.Entity);
	var data = arr[1];
	var castCols = this.castCols;
	if(typeof values == "object" && castCols){
		var tempData = arr[1] = {};
		for (var key in data) {
			tempData[key] = data[key];	
		}
		for (var key in castCols) {
			var value = tempData[key];
			if(value && typeof value != "string"){
				tempData[key] = JSON.stringify(value);
			}
		}
	}
	client.update.apply(client, arr);
}

func Select(client *Client, cnd string, args string, cb func()) {
	var self = this;
	var arr = Array.prototype.slice.apply(arguments);
	var cb = arr[arr.length -1];
	arr[arr.length -1] = function(err, data){
		if(err) return cb(err);
		var castCols = self.castCols;
		if(data && castCols){
			for (var key in castCols) {
				var value = data[key];
				if(value){
					//todo oldma 遇到单倍数正斜线会报错,所以double一下
					value = value.replace(/\\/g,'\\\\');
					data[key] = JSON.parse(value);
				} else {
					var castType = castCols[key];
					if(castType == BaseDao.CAST_ARRAY) value = [];
					else if(castType == BaseDao.CAST_OBJECT) value = {};
					data[key] = value;
				}
			}
		}
		cb(null, data);
	}
	arr.splice(0, 1, this.Entity);
	client.select.apply(client, arr);
}

func Count(client *Client, cnd string, args string, cb func()) {
	var arr = Array.prototype.slice.apply(arguments);
	arr.splice(0, 1, this.Entity);
	client.count.apply(client, arr);
}

func Query(client *Client, cnd string, args string, cb func()) {
	var self = this;
	var arr = Array.prototype.slice.apply(arguments);
	var cb = arr[arr.length -1];
	arr[arr.length -1] = function(err, dataList){
		if(err) return cb(err);
		var castCols = self.castCols;
		if(castCols){
		for (var i = 0, li = dataList.length; i < li; i++) {
			var data = dataList[i];
			for (var key in castCols) {
				var value = data[key];
				if(value){
					//todo oldma 遇到单倍数正斜线会报错,所以double一下
					value = value.replace(/\\/g,'\\\\');
					data[key] = JSON.parse(value);
				} else {
					var castType = castCols[key];
					if(castType == BaseDao.CAST_ARRAY) value = [];
					else if(castType == BaseDao.CAST_OBJECT) value = {};
					data[key] = value;
				}
			}
		}
		}
		cb(null, dataList);
	}
	arr.splice(0, 1);
	client.query.apply(client, arr);
}

func List(client *Client, cnd string, args string, cb func()) {
	var self = this;
	var arr = Array.prototype.slice.apply(arguments);
	var cb = arr[arr.length -1];
	arr[arr.length -1] = function(err, dataList){
		if(err) return cb(err);
		var castCols = self.castCols;
		if(castCols){
		for (var i = 0, li = dataList.length; i < li; i++) {
			var data = dataList[i];
			for (var key in castCols) {
				var value = data[key];
				if (value) {
					//todo oldma 遇到单倍数正斜线会报错,所以double一下
					value = value.replace(/\\/g,'\\\\');
					data[key] = JSON.parse(value);
				} else {
					var castType = castCols[key];
					if(castType == BaseDao.CAST_ARRAY) value = [];
					else if(castType == BaseDao.CAST_OBJECT) value = {};
					data[key] = value;
				}
			}
		}
		}
		cb(null, dataList);
	}
	arr.splice(0, 1, this.Entity);
	client.list.apply(client, arr);
}

func Del(client, cnd, args, cb) {
	var arr = Array.prototype.slice.apply(arguments);
	arr.splice(0, 1, this.Entity);
	client.del.apply(client, arr);
}


func SelectCols(client *Client, cols string, cnd string, args string, cb func()) {
	var self = this;
	var arr = Array.prototype.slice.apply(arguments);
	var cb = arr[arr.length -1];
	arr[arr.length -1] = function(err, data){
		if(err) return cb(err);
		var castCols = self.castCols;
		if(data && castCols){
			for (var key in castCols) {
				var value = data[key];
				if (value) {
					//todo oldma 遇到单倍数正斜线会报错,所以double一下
					value = value.replace(/\\/g,'\\\\');
					data[key] = JSON.parse(value);
				} else {
					var castType = castCols[key];
					if(castType == BaseDao.CAST_ARRAY) value = [];
					else if(castType == BaseDao.CAST_OBJECT) value = {};
					data[key] = value;
				}
			}
		}
		cb(null, data);
	}
	arr.splice(0, 1, this.Entity);
	client.selectCols.apply(client, arr);
}

func ListCols(client *Client, cols string, cnd string, args string, cb func()) {
	var self = this;
	var arr = Array.prototype.slice.apply(arguments);
	var cb = arr[arr.length -1];
	arr[arr.length -1] = function(err, dataList){
		if(err) return cb(err);
		var castCols = self.castCols;
		if(castCols){
			for (var i = 0, li = dataList.length; i < li; i++) {
				var data = dataList[i];
				for (var key in castCols) {
					var value = data[key];
					if (value) {
						//todo oldma 遇到单倍数正斜线会报错,所以double一下
						value = value.replace(/\\/g,'\\\\');
						data[key] = JSON.parse(value);
					} else {
						var castType = castCols[key];
						if(castType == BaseDao.CAST_ARRAY) value = [];
						else if(castType == BaseDao.CAST_OBJECT) value = {};
						data[key] = value;
					}
				}
			}
		}
		cb(null, dataList);
	}
	arr.splice(0, 1, this.Entity);
	client.listCols.apply(client, arr);
}