WITH flows_with_targets_and_origins AS (
    SELECT 
        f.id,
        f.project_id,
        date_part('year'::text, f.date) AS year,
        f.flow_type,
        f.value,
        f.value_iso,
        f.response_or_capacity,
        f.assistance_type,
        array_agg(DISTINCT fto.stakeholder_id) AS origins,
        array_agg(DISTINCT ftt.stakeholder_id) AS targets,
        array_agg(DISTINCT etf.event_id) AS events,
        array_agg(DISTINCT ccs.cc_id) AS core_capacities,
        array_agg(DISTINCT ces.ce_id) AS core_elements
    FROM flows f
    LEFT JOIN flows_to_stakeholder_origins fto ON fto.flow_id = f.id
    LEFT JOIN flows_to_stakeholder_targets ftt ON ftt.flow_id = f.id
    LEFT JOIN ccs_to_flows ccs ON ccs.flow_id = f.id
    LEFT JOIN ces_to_flows ces ON ces.flow_id = f.id
    LEFT JOIN events_to_flows etf ON etf.flow_id = f.id
    where f.flow_type = 'disbursed_funds' and f.assistance_type = 'financial' and f.value > 0
    GROUP BY 
        f.id, f.project_id, (date_part('year'::text, f.date)), f.flow_type, 
        f.value, f.value_iso, f.response_or_capacity, f.assistance_type
)
SELECT 
    min(flows_with_targets_and_origins.id) AS sf_id,
    flows_with_targets_and_origins.project_id,
    flows_with_targets_and_origins.year,
    flows_with_targets_and_origins.flow_type,
    sum(flows_with_targets_and_origins.value) AS value,
    flows_with_targets_and_origins.value_iso,
    flows_with_targets_and_origins.response_or_capacity,
    flows_with_targets_and_origins.assistance_type,
    flows_with_targets_and_origins.origins,
    array_agg(DISTINCT s1.name) AS origin_names,
    flows_with_targets_and_origins.targets,
    array_agg(DISTINCT s2.name) AS target_names ,
    flows_with_targets_and_origins.events,
    array_agg(distinct e.name) as event_name,
    flows_with_targets_and_origins.core_capacities,
    array_agg(distinct cc.name) as core_capacity_name,
    flows_with_targets_and_origins.core_elements,
    array_agg(distinct ce.name) as core_element_name
FROM flows_with_targets_and_origins
LEFT JOIN stakeholders s1 ON s1.id = ANY(flows_with_targets_and_origins.origins)
LEFT JOIN stakeholders s2 ON s2.id = ANY(flows_with_targets_and_origins.targets)
left join events e on e.id = ANY(flows_with_targets_and_origins.events)
left join core_capacities cc on cc.id = ANY(flows_with_targets_and_origins.core_capacities)
left join core_elements ce on ce.id = any(flows_with_targets_and_origins.core_elements)
where flows_with_targets_and_origins.year between 2009 and 2022
GROUP BY 
    flows_with_targets_and_origins.project_id, flows_with_targets_and_origins.year, 
    flows_with_targets_and_origins.flow_type, flows_with_targets_and_origins.value_iso, 
    flows_with_targets_and_origins.response_or_capacity, flows_with_targets_and_origins.assistance_type, 
    flows_with_targets_and_origins.origins, flows_with_targets_and_origins.targets, 
    flows_with_targets_and_origins.events, flows_with_targets_and_origins.core_capacities, 
    flows_with_targets_and_origins.core_elements;
