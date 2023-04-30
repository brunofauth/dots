def g:IsNull(self: any): bool
    return type(self) == v:t_none
enddef

def g:GetOrNone(self: dict<any>, key: any): any
    return self->get(key, v:none)
enddef

def g:AndThen(self: any, Fn: func(any): any): any
    return g:IsNull(self) ? self : Fn(self)
enddef

def g:UnwrapOr(self: any, other: any): any
    return g:IsNull(self) ? other : self
enddef

def g:Unwrap(self: any): any
    if g:IsNull(self)
        throw "UnwrapNoneError"
    endif
    return self
enddef

