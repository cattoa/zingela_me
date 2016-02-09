%h1.page-header
  Show All Community Growth Forms
-if(@community_covers)
  %table.table
    %tr
      %th
        Id
      %th
        Species
      %th
        Count
      %th
        Predicted Cover
      %th
        Difference
      %th
        Precentage Cover
      %th
        Proportional Cover
      %th
        Mean Canopy Diameter
      %th
        Individuals Per Hectare
      %th
        Number of communities
      %th
        Observation Id
      %th
        Competitor
      %th
        Community growth form id
    -@community_covers.each do |cc|
      %tr
        %th
          = cc.id
        %th
          = Species.find(cc.species_id).name
        %th
          = cc.count
        %th
          = cc.predicted_cover
        %th
          = cc.difference
        %th
          = cc.percentage_cover
        %th
          = cc.proportional_cover
        %th
          = cc.mean_canopy_diameter
        %th
          = cc.individual_per_hectare
        %th
          = cc.number_of_communiunities
        %th
          = cc.observation_id
        %th
          = cc.competitor
        %th
          = cc.community_growth_form_id


-else
  %p No data found
= link_to 'Back', field_data_path, class: "btn btn-default"
