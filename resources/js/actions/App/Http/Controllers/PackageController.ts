import { queryParams, type RouteQueryOptions, type RouteDefinition, type RouteFormDefinition, applyUrlDefaults } from './../../../../wayfinder'
/**
* @see \App\Http\Controllers\PackageController::create
 * @see app/Http/Controllers/PackageController.php:29
 * @route '/packages/create'
 */
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/packages/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\PackageController::create
 * @see app/Http/Controllers/PackageController.php:29
 * @route '/packages/create'
 */
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\PackageController::create
 * @see app/Http/Controllers/PackageController.php:29
 * @route '/packages/create'
 */
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})
/**
* @see \App\Http\Controllers\PackageController::create
 * @see app/Http/Controllers/PackageController.php:29
 * @route '/packages/create'
 */
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

    /**
* @see \App\Http\Controllers\PackageController::create
 * @see app/Http/Controllers/PackageController.php:29
 * @route '/packages/create'
 */
    const createForm = (options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
        action: create.url(options),
        method: 'get',
    })

            /**
* @see \App\Http\Controllers\PackageController::create
 * @see app/Http/Controllers/PackageController.php:29
 * @route '/packages/create'
 */
        createForm.get = (options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: create.url(options),
            method: 'get',
        })
            /**
* @see \App\Http\Controllers\PackageController::create
 * @see app/Http/Controllers/PackageController.php:29
 * @route '/packages/create'
 */
        createForm.head = (options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: create.url({
                        [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                            _method: 'HEAD',
                            ...(options?.query ?? options?.mergeQuery ?? {}),
                        }
                    }),
            method: 'get',
        })
    
    create.form = createForm
/**
* @see \App\Http\Controllers\PackageController::store
 * @see app/Http/Controllers/PackageController.php:37
 * @route '/packages'
 */
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/packages',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\PackageController::store
 * @see app/Http/Controllers/PackageController.php:37
 * @route '/packages'
 */
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\PackageController::store
 * @see app/Http/Controllers/PackageController.php:37
 * @route '/packages'
 */
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

    /**
* @see \App\Http\Controllers\PackageController::store
 * @see app/Http/Controllers/PackageController.php:37
 * @route '/packages'
 */
    const storeForm = (options?: RouteQueryOptions): RouteFormDefinition<'post'> => ({
        action: store.url(options),
        method: 'post',
    })

            /**
* @see \App\Http\Controllers\PackageController::store
 * @see app/Http/Controllers/PackageController.php:37
 * @route '/packages'
 */
        storeForm.post = (options?: RouteQueryOptions): RouteFormDefinition<'post'> => ({
            action: store.url(options),
            method: 'post',
        })
    
    store.form = storeForm
/**
* @see \App\Http\Controllers\PackageController::edit
 * @see app/Http/Controllers/PackageController.php:78
 * @route '/packages/{package}/edit'
 */
export const edit = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/packages/{package}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\PackageController::edit
 * @see app/Http/Controllers/PackageController.php:78
 * @route '/packages/{package}/edit'
 */
edit.url = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { package: args }
    }

    
    if (Array.isArray(args)) {
        args = {
                    package: args[0],
                }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
                        package: args.package,
                }

    return edit.definition.url
            .replace('{package}', parsedArgs.package.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\PackageController::edit
 * @see app/Http/Controllers/PackageController.php:78
 * @route '/packages/{package}/edit'
 */
edit.get = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})
/**
* @see \App\Http\Controllers\PackageController::edit
 * @see app/Http/Controllers/PackageController.php:78
 * @route '/packages/{package}/edit'
 */
edit.head = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

    /**
* @see \App\Http\Controllers\PackageController::edit
 * @see app/Http/Controllers/PackageController.php:78
 * @route '/packages/{package}/edit'
 */
    const editForm = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
        action: edit.url(args, options),
        method: 'get',
    })

            /**
* @see \App\Http\Controllers\PackageController::edit
 * @see app/Http/Controllers/PackageController.php:78
 * @route '/packages/{package}/edit'
 */
        editForm.get = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: edit.url(args, options),
            method: 'get',
        })
            /**
* @see \App\Http\Controllers\PackageController::edit
 * @see app/Http/Controllers/PackageController.php:78
 * @route '/packages/{package}/edit'
 */
        editForm.head = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: edit.url(args, {
                        [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                            _method: 'HEAD',
                            ...(options?.query ?? options?.mergeQuery ?? {}),
                        }
                    }),
            method: 'get',
        })
    
    edit.form = editForm
/**
* @see \App\Http\Controllers\PackageController::update
 * @see app/Http/Controllers/PackageController.php:92
 * @route '/packages/{package}'
 */
export const update = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/packages/{package}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\PackageController::update
 * @see app/Http/Controllers/PackageController.php:92
 * @route '/packages/{package}'
 */
update.url = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { package: args }
    }

    
    if (Array.isArray(args)) {
        args = {
                    package: args[0],
                }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
                        package: args.package,
                }

    return update.definition.url
            .replace('{package}', parsedArgs.package.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\PackageController::update
 * @see app/Http/Controllers/PackageController.php:92
 * @route '/packages/{package}'
 */
update.put = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})
/**
* @see \App\Http\Controllers\PackageController::update
 * @see app/Http/Controllers/PackageController.php:92
 * @route '/packages/{package}'
 */
update.patch = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

    /**
* @see \App\Http\Controllers\PackageController::update
 * @see app/Http/Controllers/PackageController.php:92
 * @route '/packages/{package}'
 */
    const updateForm = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'post'> => ({
        action: update.url(args, {
                    [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                        _method: 'PUT',
                        ...(options?.query ?? options?.mergeQuery ?? {}),
                    }
                }),
        method: 'post',
    })

            /**
* @see \App\Http\Controllers\PackageController::update
 * @see app/Http/Controllers/PackageController.php:92
 * @route '/packages/{package}'
 */
        updateForm.put = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'post'> => ({
            action: update.url(args, {
                        [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                            _method: 'PUT',
                            ...(options?.query ?? options?.mergeQuery ?? {}),
                        }
                    }),
            method: 'post',
        })
            /**
* @see \App\Http\Controllers\PackageController::update
 * @see app/Http/Controllers/PackageController.php:92
 * @route '/packages/{package}'
 */
        updateForm.patch = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'post'> => ({
            action: update.url(args, {
                        [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                            _method: 'PATCH',
                            ...(options?.query ?? options?.mergeQuery ?? {}),
                        }
                    }),
            method: 'post',
        })
    
    update.form = updateForm
/**
* @see \App\Http\Controllers\PackageController::destroy
 * @see app/Http/Controllers/PackageController.php:145
 * @route '/packages/{package}'
 */
export const destroy = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/packages/{package}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\PackageController::destroy
 * @see app/Http/Controllers/PackageController.php:145
 * @route '/packages/{package}'
 */
destroy.url = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { package: args }
    }

    
    if (Array.isArray(args)) {
        args = {
                    package: args[0],
                }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
                        package: args.package,
                }

    return destroy.definition.url
            .replace('{package}', parsedArgs.package.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\PackageController::destroy
 * @see app/Http/Controllers/PackageController.php:145
 * @route '/packages/{package}'
 */
destroy.delete = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

    /**
* @see \App\Http\Controllers\PackageController::destroy
 * @see app/Http/Controllers/PackageController.php:145
 * @route '/packages/{package}'
 */
    const destroyForm = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'post'> => ({
        action: destroy.url(args, {
                    [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                        _method: 'DELETE',
                        ...(options?.query ?? options?.mergeQuery ?? {}),
                    }
                }),
        method: 'post',
    })

            /**
* @see \App\Http\Controllers\PackageController::destroy
 * @see app/Http/Controllers/PackageController.php:145
 * @route '/packages/{package}'
 */
        destroyForm.delete = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'post'> => ({
            action: destroy.url(args, {
                        [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                            _method: 'DELETE',
                            ...(options?.query ?? options?.mergeQuery ?? {}),
                        }
                    }),
            method: 'post',
        })
    
    destroy.form = destroyForm
/**
* @see \App\Http\Controllers\PackageController::index
 * @see app/Http/Controllers/PackageController.php:15
 * @route '/packages'
 */
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/packages',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\PackageController::index
 * @see app/Http/Controllers/PackageController.php:15
 * @route '/packages'
 */
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\PackageController::index
 * @see app/Http/Controllers/PackageController.php:15
 * @route '/packages'
 */
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})
/**
* @see \App\Http\Controllers\PackageController::index
 * @see app/Http/Controllers/PackageController.php:15
 * @route '/packages'
 */
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

    /**
* @see \App\Http\Controllers\PackageController::index
 * @see app/Http/Controllers/PackageController.php:15
 * @route '/packages'
 */
    const indexForm = (options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
        action: index.url(options),
        method: 'get',
    })

            /**
* @see \App\Http\Controllers\PackageController::index
 * @see app/Http/Controllers/PackageController.php:15
 * @route '/packages'
 */
        indexForm.get = (options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: index.url(options),
            method: 'get',
        })
            /**
* @see \App\Http\Controllers\PackageController::index
 * @see app/Http/Controllers/PackageController.php:15
 * @route '/packages'
 */
        indexForm.head = (options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: index.url({
                        [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                            _method: 'HEAD',
                            ...(options?.query ?? options?.mergeQuery ?? {}),
                        }
                    }),
            method: 'get',
        })
    
    index.form = indexForm
/**
* @see \App\Http\Controllers\PackageController::show
 * @see app/Http/Controllers/PackageController.php:70
 * @route '/packages/{package}'
 */
export const show = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

show.definition = {
    methods: ["get","head"],
    url: '/packages/{package}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\PackageController::show
 * @see app/Http/Controllers/PackageController.php:70
 * @route '/packages/{package}'
 */
show.url = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { package: args }
    }

    
    if (Array.isArray(args)) {
        args = {
                    package: args[0],
                }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
                        package: args.package,
                }

    return show.definition.url
            .replace('{package}', parsedArgs.package.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\PackageController::show
 * @see app/Http/Controllers/PackageController.php:70
 * @route '/packages/{package}'
 */
show.get = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})
/**
* @see \App\Http\Controllers\PackageController::show
 * @see app/Http/Controllers/PackageController.php:70
 * @route '/packages/{package}'
 */
show.head = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: show.url(args, options),
    method: 'head',
})

    /**
* @see \App\Http\Controllers\PackageController::show
 * @see app/Http/Controllers/PackageController.php:70
 * @route '/packages/{package}'
 */
    const showForm = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
        action: show.url(args, options),
        method: 'get',
    })

            /**
* @see \App\Http\Controllers\PackageController::show
 * @see app/Http/Controllers/PackageController.php:70
 * @route '/packages/{package}'
 */
        showForm.get = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: show.url(args, options),
            method: 'get',
        })
            /**
* @see \App\Http\Controllers\PackageController::show
 * @see app/Http/Controllers/PackageController.php:70
 * @route '/packages/{package}'
 */
        showForm.head = (args: { package: string | number } | [packageParam: string | number ] | string | number, options?: RouteQueryOptions): RouteFormDefinition<'get'> => ({
            action: show.url(args, {
                        [options?.mergeQuery ? 'mergeQuery' : 'query']: {
                            _method: 'HEAD',
                            ...(options?.query ?? options?.mergeQuery ?? {}),
                        }
                    }),
            method: 'get',
        })
    
    show.form = showForm
const PackageController = { create, store, edit, update, destroy, index, show }

export default PackageController