package main

import (
	"bytes"
	"encoding/gob"
	"fmt"
	"reflect"
)

func main() {

	copyFromInterface()

}

func copyFromInterface() {
	type colDef struct {
		Id       int32
		name     string
		area     string
		host     string
		port     string
		serverId int32
	}
	var col colDef
	col.Id = 9527
	var outCols []interface{} = []interface{}{&col}

	fmt.Println("outCols[0]:", outCols[0])

	tp := reflect.TypeOf(outCols[0])
	fmt.Println("tp:\n", tp)

	val := reflect.ValueOf(outCols[0])
	fmt.Println("val:\n", val)

	ele := val.Elem()
	fmt.Println("ele:\n", ele)

	refTp := ele.Type()
	fmt.Println("refTp:\n", refTp)

	field := ele.Field(0)
	fmt.Printf("field:%v %x\n", &field, field.UnsafeAddr())

	numField := ele.NumField()
	fmt.Println("numField:\n", numField)

	a := refTp.NumField()
	fmt.Println("a:\n", a)

	record := reflect.New(ele.Type()).Interface()
	// record := reflect.New(tp).Interface()
	fmt.Println("record:\n", &record.(*colDef).Id)

	recVal := reflect.ValueOf(record)
	fmt.Println("recVal:\n", recVal)

	recEle := recVal.Elem()
	fmt.Println("recEle:\n", recEle)

	// tp1 := reflect.TypeOf(outCols[1])
	// val1 := reflect.ValueOf(outCols[1])

	// fmt.Println("tp1:", tp1)
	// fmt.Println("val1:", val1)

}

// Clone 完整复制数据
func Clone(a, b interface{}) error {
	buff := new(bytes.Buffer)
	enc := gob.NewEncoder(buff)
	dec := gob.NewDecoder(buff)
	if err := enc.Encode(a); err != nil {
		return err
	}
	if err := dec.Decode(b); err != nil {
		return err
	}
	return nil
}
