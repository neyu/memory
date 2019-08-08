package fx

type Service struct {
	env  string
	name string
	id   string

	ip    string
	ports map[string]string
}
