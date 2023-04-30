def g:IsNull(self: any): bool
    return type(self) == v:t_none
enddef

def g:GetOrNone(self: dict<any>, key: any): any
    return self->get(key, v:none)
enddef

def g:AndThen(self: any, Fn: func(any, list<any>): any, args: list<any>): any
    return !g:IsNull(self) ? call(function(Fn, [self]), args) : v:none
enddef

def g:UnwrapOr(self: any, other: any): any
    return !g:IsNull(self) ? self : other
enddef

def g:Unwrap(self: any): any
    if g:IsNull(self)
        throw "UnwrapNoneError"
    endif
    return self
enddef

